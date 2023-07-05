import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:for_food/modelo/beans/usuario.dart';
import 'package:for_food/visao/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CadastroUsuarioPage());
}

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({super.key});

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  late String _tipoSelecionado;

  @override
  initState() {
    _tipoSelecionado = "cliente";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            DropdownButtonFormField<String>(
              value: _tipoSelecionado,
              decoration: const InputDecoration(labelText: 'Tipo'),
              items: const [
                DropdownMenuItem(value: 'cliente', child: Text('Cliente')),
                DropdownMenuItem(
                    value: 'administrador', child: Text('Administrador')),
              ],
              onChanged: (value) {
                setState(() {
                  _tipoSelecionado = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                child: const Text('Cadastrar'),
                onPressed: () async {
                  await cadastrarUsuario(_nomeController.text,
                      _senhaController.text, _tipoSelecionado);
                }),
          ],
        ),
      ),
    );
  }

  var db = FirebaseFirestore.instance;

  cadastrarUsuario(nome, senha, tipoUsuario) async {
    // Enviar os dados para o Firestore
    final documento = db.collection('usuarios').doc();

    UsuarioModelo usuario = UsuarioModelo(
      nome: nome.toString(),
      senha: senha.toString(),
      tipoUsuario: tipoUsuario.toString(),
    );

    await documento.set(usuario.toJson()).then((value) => log("Cadastrou!"),
        onError: (e) => log("Deu ruim: $e"));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
