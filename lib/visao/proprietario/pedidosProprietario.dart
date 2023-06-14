import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PedidosProprietario extends StatefulWidget {
  @override
  _PedidosProprietarioState createState() => _PedidosProprietarioState();
}

class _PedidosProprietarioState extends State<PedidosProprietario> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos do Cliente Atual"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text("Sua mãe é a melhor!!!"),
      ),
    );
  }
}
