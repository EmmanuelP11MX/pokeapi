import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({required this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.num!,
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pokemon.name!,
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Altura: ${pokemon.height}"),
                  Text("Peso: ${pokemon.weight}"),
                  const Text(
                    "Tipo(s)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  const Text("Debilidades",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses!
                        .map((t) => FilterChip(
                            backgroundColor: Colors.red,
                            label: Text(
                              t,
                              style: TextStyle(color: Colors.white),
                            ),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  const Text("Siguiente Evolución",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution == null
                        ? <Widget>[Text("Esta es su forma final")]
                        : pokemon.nextEvolution!
                            .map((n) => FilterChip(
                                  backgroundColor: Colors.green,
                                  label: Text(
                                    n.name!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                ))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img!,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(pokemon.img!))),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text(pokemon.name!),
      ),
      body: bodyWidget(context),
    );
  }
}
