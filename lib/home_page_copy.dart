import 'package:flutter/material.dart';
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
        TextButton(onPressed: () {}, child: const Text('Adicionar')),
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
            TextButton(onPressed: () {}, child: Container()),
            const SizedBox(width: 10),
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
        ValueListenableBuilder(
          valueListenable: counterNotifier,
          builder: (context, value, _) {
            return Text('Contagem: $value');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  counterNotifier.value--;
                },
                child: const Text('Diminuir')),
            const SizedBox(width: 10),
            TextButton(
                onPressed: () {
                  counterNotifier.value++;
                },
                child: const Text('Aumentar')),
          ],
        ),
      ],
    );
  }
}
