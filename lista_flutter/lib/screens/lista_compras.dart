import 'package:flutter/material.dart';
import 'package:lista_flutter/screens/formulario_compra.dart';

import '../models/adicionar_item.dart';

const _titleAppBar = "Lista de compras";

class ListaDeCompras extends StatefulWidget {
  final List<AdicionarItem> _itemAdicionado = List.empty(growable: true);

  ListaDeCompras({Key? key}) : super(key: key);

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
          _titleAppBar,
          textAlign: TextAlign.center,
        ),
      ),
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
          })).then((compraAdicionada) => _atualiza(compraAdicionada));
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  void _atualiza(compraAdicionada) {
    if (compraAdicionada != null) {
      setState(() {
        widget._itemAdicionado.add(compraAdicionada);
      });
    }
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
