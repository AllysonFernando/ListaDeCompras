import 'package:flutter/material.dart';

void main() => runApp(ListaDeComprasApp());

class ListaDeComprasApp extends StatelessWidget {
  const ListaDeComprasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioCompra(),
      ),
    );
  }
}

class ListaDeCompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Lista de Compras",
        textAlign: TextAlign.center,
      )),
      body: Column(
        children: <Widget>[
          ItensAdicionado(AdicionarItem("Arroz", 2)),
          ItensAdicionado(AdicionarItem("Arroz", 2)),
          ItensAdicionado(AdicionarItem("Arroz", 2)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

class ItensAdicionado extends StatelessWidget {
  final AdicionarItem _adicionarItem;

  ItensAdicionado(this._adicionarItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text(_adicionarItem.item.toString()),
        subtitle: Text('Qtd: ${_adicionarItem.quantidade.toString()}'),
      ),
    );
  }
}

class AdicionarItem {
  final String item;
  final int quantidade;

  AdicionarItem(this.item, this.quantidade);
}

class FormularioCompra extends StatelessWidget {
  const FormularioCompra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Itens")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                labelText: "Nome",
                hintText: "Ex. Arroz",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Quantidade",
              ),
            ),
            ElevatedButton(onPressed: () => {}, child: Text("Confirmar"))
          ],
        ),
      ),
    );
  }
}
