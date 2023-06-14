import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinhaContaProprietario extends StatefulWidget {
  @override
  _MinhaContaProprietarioState createState() => _MinhaContaProprietarioState();
}

class _MinhaContaProprietarioState extends State<MinhaContaProprietario> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta Proprietario"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
