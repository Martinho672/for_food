import 'package:flutter/material.dart';
import 'package:for_food/visao/proprietario/menuProprietario.dart';
import 'package:for_food/visao/cliente/menuCliente.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  String _mensagemErro = '';

  // Função para verificar as credenciais de login
  void _fazerLogin() {
    String login = _loginController.text;
    String senha = _senhaController.text;

    if (login == 'cliente' && senha == 'cliente') {
      // Login do cliente
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuCliente(0)),
      );
    } else if (login == 'proprietario' && senha == 'proprietario') {
      // Login do proprietário
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuProprietario(0)),
      );
    } else {
      setState(() {
        _mensagemErro = 'Login ou senha inválidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Altere a cor para roxo
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Faça o login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity, // Largura máxima
                constraints: BoxConstraints(maxWidth: 300), // Largura máxima de 300
                child: TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                    hintText: 'Login',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity, // Largura máxima
                constraints: BoxConstraints(maxWidth: 300), // Largura máxima de 300
                child: TextField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fazerLogin,
                child: Text('Entrar'),
              ),
              SizedBox(height: 8),
              Text(
                _mensagemErro,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
