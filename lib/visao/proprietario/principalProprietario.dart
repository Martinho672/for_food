import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrincipalProprietario extends StatefulWidget {
  @override
  _PrincipalProprietarioState createState() => _PrincipalProprietarioState();
}

class _PrincipalProprietarioState extends State<PrincipalProprietario> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Principal"),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
