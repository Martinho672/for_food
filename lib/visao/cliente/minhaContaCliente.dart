import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinhaContaCliente extends StatefulWidget {
  @override
  _MinhaContaClienteState createState() => _MinhaContaClienteState();
}

class _MinhaContaClienteState extends State<MinhaContaCliente> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
