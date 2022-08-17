import 'package:flutter/material.dart';

void main() => runApp(const ListaDeComprasApp());

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
  const ListaDeCompras({Key? key}) : super(key: key);

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
  FormularioCompra({Key? key}) : super(key: key);

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar Itens")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controladorNome,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                labelText: "Nome",
                hintText: "Ex. Arroz",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _controladorQuantidade,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                icon: Icon(Icons.store_mall_directory),
                labelText: "Quantidade",
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
                child: ElevatedButton(
                    onPressed: () => {}, child: const Text("Adicionar"))),
          ],
        ),
      ),
    );
  }
}
