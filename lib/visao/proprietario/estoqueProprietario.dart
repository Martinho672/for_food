import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstoqueProprietario extends StatefulWidget {
  @override
  _EstoqueProprietarioState createState() => _EstoqueProprietarioState();
}

class _EstoqueProprietarioState extends State<EstoqueProprietario> {
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Permite que o corpo da tela se estenda atrás da barra superior
      appBar: AppBar(
        title: Text("Estoque de produtos e cardápio"),
        backgroundColor: Colors.deepPurple[800], // Define a cor roxa mais escura para a barra superior
        elevation: 0, // Remove a sombra da barra superior
      ),
      body: Center(
        child: Text("Sua mãe é a melhor!!!"),
      ),
    );
  }
}
