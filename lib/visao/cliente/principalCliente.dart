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
        title: Text("Principal"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
