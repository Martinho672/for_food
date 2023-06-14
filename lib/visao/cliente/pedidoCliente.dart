import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PedidoCliente extends StatefulWidget {
  @override
  _PedidoClienteState createState() => _PedidoClienteState();
}

class _PedidoClienteState extends State<PedidoCliente> {
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
