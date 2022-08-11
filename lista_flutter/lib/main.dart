// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ListaDeCompras(),
          appBar: AppBar(
              title: const Text(
            "Lista de Compras",
            textAlign: TextAlign.center,
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: const Icon(Icons.add_shopping_cart),
          ),
        ),
      ),
    );

class ListaDeCompras extends StatelessWidget {
  const ListaDeCompras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AdicionarItem(item: "Arroz", quantidade: "2"),
        AdicionarItem(item: "Bolacha", quantidade: "1")
      ],
    );
  }
}

class AdicionarItem extends StatelessWidget {
  final String item;
  final String quantidade;

  const AdicionarItem(
      {super.key, required this.item, required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(item),
        subtitle: Text("Qtd: $quantidade"),
      ),
    );
  }
}
