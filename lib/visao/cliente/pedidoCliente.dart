import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/customcard2.dart';

class PedidoCliente extends StatefulWidget {
  @override
  _PedidoClienteState createState() => _PedidoClienteState();
}

class _PedidoClienteState extends State<PedidoCliente> {
  List<Map<String, String>> dados = [];
  @override
  void initState() {
    super.initState();
    getUsuario();
  }

  void getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usuarioLogado = prefs.getString('usuarioId');
    if (usuarioLogado != null) {
      retornaPedidos(usuarioLogado.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ...dados.map((item) => CustomCard2(
                      nome: item['nome']!,
                      valor: item['valor']!,
                      imagem: item['imagem']!,
                      status: item['status']!,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getPedidos(
      String usuarioId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pedidos')
        .where('cliente_id', isEqualTo: usuarioId)
        .get();

    return querySnapshot.docs;
  }

  void retornaPedidos(String usuarioId) async {
    List<QueryDocumentSnapshot<Object?>> documentList =
        await getPedidos(usuarioId);

    setState(() {
      dados = documentList.map((document) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        String nome = data?['nome'] ?? '';
        String valor = data?['valor'] ?? '';
        String imagem = data?['imagem'] ?? '';
        String clienteId = data?['cliente_id'] ?? '';
        String status = data?['status'] ?? '';

        return {
          'nome': nome,
          'valor': valor,
          'imagem': imagem,
          'cliente_id': clienteId,
          'status': status,
        };
      }).toList();
    });
  }
}
