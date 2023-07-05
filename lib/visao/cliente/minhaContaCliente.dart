import 'package:flutter/material.dart';
import 'package:for_food/visao/login.dart';

class MinhaContaCliente extends StatefulWidget {
  @override
  _MinhaContaClienteState createState() => _MinhaContaClienteState();
}

class _MinhaContaClienteState extends State<MinhaContaCliente> {
  void sair() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Conta"),
        backgroundColor: Colors.lightBlueAccent, // Altera a cor da AppBar para roxo
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
