import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalCliente extends StatefulWidget {
  @override
  _PrincipalClienteState createState() => _PrincipalClienteState();
}

class _PrincipalClienteState extends State<PrincipalCliente> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "Bem-vindo à tela Principal!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
