import 'package:flutter/material.dart';

void main() => runApp(const ListaDeComprasApp());

class ListaDeComprasApp extends StatelessWidget {
  const ListaDeComprasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaDeCompras(),
      ),
    );
  }
}

class ListaDeCompras extends StatefulWidget {
  final List<AdicionarItem> _itemAdicionado = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaDeComprasState();
  }
}

class ListaDeComprasState extends State<ListaDeCompras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Lista de Compras",
        textAlign: TextAlign.center,
      )),
      body: ListView.builder(
        itemCount: widget._itemAdicionado.length,
        itemBuilder: (context, index) {
          final itemFinal = widget._itemAdicionado[index];
          return ItensAdicionado(itemFinal);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioCompra();
          }));
          future.then((compraAdicionada) {
            if (compraAdicionada != null) {
              setState(() {
                widget._itemAdicionado.add(compraAdicionada);
              });
            }
          });
        },
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

class FormularioCompra extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioCompraState();
  }
}

class FormularioCompraState extends State<FormularioCompra> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Adicionar Itens")),
        body: SingleChildScrollView(
          child: Column(children: [
            Editor(
                controlador: _controladorNome,
                campoItem: "Item",
                campoDica: "Ex. Arroz",
                teclado: TextInputType.text),
            Editor(
                controlador: _controladorQuantidade,
                campoItem: "Quantidade",
                campoDica: "Ex. 1",
                teclado: TextInputType.number,
                icone: Icons.store_mall_directory),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
                child: ElevatedButton(
                    onPressed: () => {
                          _criarCompra(context),
                        },
                    child: const Text("Adicionar"))),
          ]),
        ));
  }

  void _criarCompra(BuildContext context) {
    final String nomeProduto = _controladorNome.text;
    final int? quantidadeCompra = int.tryParse(_controladorQuantidade.text);
    if (nomeProduto != null && quantidadeCompra != null) {
      final compraAdicionada = AdicionarItem(nomeProduto, quantidadeCompra);
      Navigator.pop(context, compraAdicionada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _campoItem;
  final String _campoDica;
  final TextInputType _teclado;
  final IconData? _icone;

  const Editor(
      {Key? key,
      required TextEditingController controlador,
      required String campoItem,
      required String campoDica,
      required TextInputType teclado,
      IconData? icone})
      : _controlador = controlador,
        _campoItem = campoItem,
        _campoDica = campoDica,
        _teclado = teclado,
        _icone = icone,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: _icone != null ? Icon(_icone) : null,
          labelText: _campoItem,
          hintText: _campoDica,
        ),
        keyboardType: _teclado,
      ),
    );
  }
}
