import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/adicionar_item.dart';

class FormularioCompra extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioCompraState();
  }
}

const _tituloAppBar = "Adicionar Itens";
const _textButton = "Adicionar";

const _tituloItem = "Item";
const _dicaItem = "Ex. Arroz";

const _tituloQuantidade = "Quantidade";
const _dicaQuantidade = "Ex. 1";

class FormularioCompraState extends State<FormularioCompra> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_tituloAppBar)),
        body: SingleChildScrollView(
          child: Column(children: [
            Editor(
                controlador: _controladorNome,
                campoItem: _tituloItem,
                campoDica: _dicaItem,
                teclado: TextInputType.text),
            Editor(
                controlador: _controladorQuantidade,
                campoItem: _tituloQuantidade,
                campoDica: _dicaQuantidade,
                teclado: TextInputType.number,
                icone: Icons.store_mall_directory),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
                child: ElevatedButton(
                    onPressed: () => {
                          _criarCompra(context),
                        },
                    child: const Text(_textButton))),
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
