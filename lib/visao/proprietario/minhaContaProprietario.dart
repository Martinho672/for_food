import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_food/visao/login.dart';

class MinhaContaProprietario extends StatefulWidget {
  @override
  _MinhaContaProprietarioState createState() => _MinhaContaProprietarioState();
}

class _MinhaContaProprietarioState extends State<MinhaContaProprietario> {
  void sair() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta Proprietario"),
        backgroundColor: Colors.deepPurple[
        800], // Define a cor roxa mais escura para a barra superior
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Informações da Conta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sair,
              child: Text("Sair da Conta"),
            ),
          ],
        ),
      ),
    );
  }
}
