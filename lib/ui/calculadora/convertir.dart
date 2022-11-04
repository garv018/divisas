import 'package:flutter/material.dart';

class Convertir extends StatefulWidget {
  const Convertir({super.key});

  @override
  State<Convertir> createState() => _ConvertirState();
}

class _ConvertirState extends State<Convertir> {
  bool peso = false;
  bool dolar = false;
  bool euro = false;

  TextEditingController divA = TextEditingController();
  TextEditingController divB = TextEditingController();

  void cambiarestado() {
    peso = peso ? false : true;
    setState(() {});
  }

  void valores(String p) {
    divA.text = divA.text + p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertir Divisas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Row(
            children: [
              const Text("Valor a Convertir"),
              GestureDetector(
                onTap: () => cambiarestado(),
                child: monedas(
                  moneda: peso,
                  texto: 'P',
                ),
              ),
              GestureDetector(
                onTap: () => cambiarestado(),
                child: monedas(
                  moneda: dolar,
                  texto: "D",
                ),
              ),
              GestureDetector(
                onTap: () => cambiarestado(),
                child: monedas(moneda: euro, texto: "E"),
              ),
            ],
          ),
          TextField(
            readOnly: true,
            textAlign: TextAlign.center,
            controller: divA,
            decoration: const InputDecoration(hintText: "0.0"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Conversión"),
          TextField(
            readOnly: true,
            controller: divB,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(hintText: "0.0"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => valores("7"), child: const Botones(valor: "7")),
              GestureDetector(
                  onTap: () => valores("8"), child: const Botones(valor: "8")),
              GestureDetector(
                  onTap: () => valores("9"), child: const Botones(valor: "9")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => valores("4"), child: const Botones(valor: "4")),
              GestureDetector(
                  onTap: () => valores("5"), child: const Botones(valor: "5")),
              GestureDetector(
                  onTap: () => valores("6"), child: const Botones(valor: "6")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => valores("1"), child: const Botones(valor: "1")),
              GestureDetector(
                  onTap: () => valores("2"), child: const Botones(valor: "2")),
              GestureDetector(
                  onTap: () => valores("3"), child: const Botones(valor: "3")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Botones(valor: "."),
              GestureDetector(
                  onTap: () => valores("0"), child: const Botones(valor: "0")),
              GestureDetector(
                  onTap: () => divA.clear(), child: const Botones(valor: "CE"))
            ],
          )
        ]),
      ),
    );
  }
}

class monedas extends StatelessWidget {
  const monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: moneda ? Colors.green : Colors.amber,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String valor;
  const Botones({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 70,
        color: Colors.amber,
        child: Center(
          child: Text(
            valor,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
