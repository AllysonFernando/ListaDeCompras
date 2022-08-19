import 'package:flutter/material.dart';
import 'package:lista_flutter/screens/lista_compras.dart';

void main() => runApp(const ListaDeComprasApp());

class ListaDeComprasApp extends StatelessWidget {
  const ListaDeComprasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaDeCompras(),
    );
  }
}
