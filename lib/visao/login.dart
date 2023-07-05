import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:for_food/visao/cadastro.dart';
import 'package:for_food/visao/proprietario/menuProprietario.dart';
import 'package:for_food/visao/cliente/menuCliente.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  // Função para verificar as credenciais de login
  void _fazerLogin() async {
    String login = _loginController.text;
    String senha = _senhaController.text;

    try {
      // Consulta ao Firestore para obter o usuário com o nome fornecido
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('nome', isEqualTo: login)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Obtém os dados do login
        String login = querySnapshot.docs[0].get('nome');
        String senhaArmazenada = querySnapshot.docs[0].get('password');
        String tipoUsuario = querySnapshot.docs[0].get('tipo');
        String userId = querySnapshot.docs[0].id;
        print(userId);
        // Exibe o login do usuário
        print('Login do usuário: $login');

        if (senha == senhaArmazenada) {
          if (!context.mounted) return;
          // Verifica o tipo do usuario e armazena o ID do usuario localmente
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('usuarioId', userId);
          prefs.setString('nomeUsuario', login);

          if (tipoUsuario == 'cliente') {
            Util().showBar(context, 'Login realizado com sucesso!');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuCliente(0)),
            );
          } else if (tipoUsuario == 'administrador') {
            Util().showBar(context, 'Login realizado com sucesso!');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuProprietario(0)),
            );
          }
        } else {
          Util().showBar(context, 'Senhar ou Usuario incorreto');
        }
      } else {
        Util().showBar(context, 'Usuário não encontrado. Tente novamente.');
      }
    } catch (e) {
      // Ocorreu um erro durante a consulta
      print('Erro ao obter o login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Faça o login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 300),
                child: TextField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    hintText: 'Login',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity, // Largura máxima
                constraints: const BoxConstraints(
                    maxWidth: 300), // Largura máxima de 300
                child: TextField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _fazerLogin,
                child: const Text('Entrar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),

              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Novo usuario ? '),
                  TextButton(
                    child: const Text('Cadastre-se'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroUsuarioPage(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
