import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstoqueProprietario extends StatefulWidget {
  @override
  _EstoqueProprietarioState createState() => _EstoqueProprietarioState();
}

class _EstoqueProprietarioState extends State<EstoqueProprietario> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estoque de produtos e cardapio"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text("Sua mãe é a melhor!!!"),
      ),
    );
  }
}
