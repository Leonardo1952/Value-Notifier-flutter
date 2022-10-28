import 'package:flutter/material.dart';

class Personagem extends StatelessWidget {
  final String? name;
  final int? idade;
  final String? habilidade;
  const Personagem({
    super.key,
    this.name,
    this.idade,
    this.habilidade,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: $name"),
          Text("Idade: $idade"),
          Text("Habilidade: $habilidade"),
        ],
      ),
    );
  }
}
