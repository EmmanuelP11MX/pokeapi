import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/screens/pokemon_details.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  late PokeHub pokeHub;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var res;
  void fetchData() async {
    res = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedJson);
    print(pokeHub.toJson());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Colors.red,
      ),
      body: pokeHub == null
          ? const Scaffold(
              backgroundColor: Colors.white, //Image.asset("pokeball.gif"),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon!
                  .map((poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokeDetail(
                                          pokemon: poke,
                                        )));
                          },
                          child: Hero(
                            tag: poke.img!,
                            child: Card(
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    poke.num!,
                                    style: const TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(poke.img!))),
                                  ),
                                  Text(
                                    poke.name!,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
