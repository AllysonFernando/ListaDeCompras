import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _campoItem;
  final String _campoDica;
  final TextInputType _teclado;
  final IconData? _icone;

  const Editor({
    Key? key,
    required TextEditingController controlador,
    required String campoItem,
    required String campoDica,
    required TextInputType teclado,
    IconData? icone,
  })  : _controlador = controlador,
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
