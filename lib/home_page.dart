import 'package:flutter/material.dart';
import 'package:value_notifier/personagem.dart';
import 'package:value_notifier/value_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController habilidade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contador(),
            valorBooleano(),
            personalizado(context),
          ],
        ),
      ),
    );
  }

  Widget personalizado(BuildContext context) {
    return Column(
      children: [
        const Text('Trabalhando com o tipo Personalizado',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ValueListenableBuilder(
          valueListenable: personagemNotifier,
          builder: (context, value, _) {
            return value;
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Nome: ')),
                controller: nome,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Idade: ')),
                controller: idade,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Habilidade: ')),
                controller: habilidade,
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              personagemNotifier.value = Personagem(
                name: nome.text,
                habilidade: habilidade.text,
                idade: int.parse(idade.text),
              );
            },
            child: const Text('Adicionar')),
      ],
    );
  }

  Widget valorBooleano() {
    return Column(
      children: [
        const Text('Trabalhando com o tipo Boolean',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                darkNotifier.value = !darkNotifier.value;
              },
              child: ValueListenableBuilder(
                valueListenable: darkNotifier,
                builder: (context, value, _) {
                  return Text('Valor: $value');
                },
              ),
            ),
            const SizedBox(width: 10),
            ValueListenableBuilder(
              valueListenable: darkNotifier,
              builder: (context, value, _) {
                return Icon(
                  value ? Icons.shield_moon_outlined : Icons.sunny,
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget contador() {
    return Column(
      children: [
        const Text('Trabalhando com o tipo Int',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Center(
          child: ValueListenableBuilder(
            valueListenable: counterNotifier,
            builder: (context, value, _) {
              return Text('Contagem: $value');
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                counterNotifier.value--;
              },
              child: const Text('Diminuir'),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                counterNotifier.value++;
              },
              child: const Text('Aumentar'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    counterNotifier.dispose();
    darkNotifier.dispose();
    super.dispose();
  }
}
