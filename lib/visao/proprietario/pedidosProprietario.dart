import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedidosProprietario extends StatefulWidget {
  @override
  _PedidosProprietarioState createState() => _PedidosProprietarioState();
}

class _PedidosProprietarioState extends State<PedidosProprietario> {
  List<Map<String, String>> dados = [];
  @override
  void initState() {
    super.initState();
    getUsuario();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ...dados.map(
            (item) => ListTile(
              title: Text(item['nome']!),
              subtitle: Text(item['status']!),
              trailing: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  // Lógica para marcar o pedido como concluído
                  setState(() {
                    item['status'] = 'concluido';
                  });
                  var pedidoId = item['id'];
                  print(pedidoId.toString());
                  atualizaStatusPedido(pedidoId);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void atualizaStatusPedido(pedidoId) async {
    if (pedidoId != null) {
      FirebaseFirestore.instance.collection('pedidos').doc(pedidoId).update({
        'status': 'concluido',
      });
    }
  }

  void getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usuarioLogado = prefs.getString('usuarioId');
    if (usuarioLogado != null) {
      retornaPedidos(usuarioLogado.toString());
    }
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getPedidos(
      String usuarioId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pedidos')
        .where('restaurante_id', isEqualTo: usuarioId)
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
        String restauranteId = data?['restaurante_id'] ?? '';
        String status = data?['status'] ?? '';
        String id = document.id;

        return {
          'nome': nome,
          'valor': valor,
          'imagem': imagem,
          'restaurante_id': restauranteId,
          'status': status,
          'id': id,
        };
      }).toList();
    });
  }
}
