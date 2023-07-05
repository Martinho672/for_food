import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/customcard.dart';

Future<List<QueryDocumentSnapshot<Object?>>> _getCardapio() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('cardapio').get();

  return querySnapshot.docs;
}

class PrincipalCliente extends StatefulWidget {
  @override
  _PrincipalClienteState createState() => _PrincipalClienteState();
}

class _PrincipalClienteState extends State<PrincipalCliente> {
  List<Map<String, String>> dados = [];

  @override
  void initState() {
    super.initState();
    retornaLista();
  }

  Future<void> retornaLista() async {
    List<QueryDocumentSnapshot<Object?>> documentList = await _getCardapio();

    setState(() {
      dados = documentList.map((document) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        String campo1 = data?['nome'] ?? '';
        String campo2 = data?['valor'] ?? '';
        String campo3 = data?['imagem'] ?? '';
        String campo4 = data?['restaurante_id'] ?? '';

        return {
          'nome': campo1,
          'valor': campo2,
          'imagem': campo3,
          'restaurante_id': campo4,
        };
      }).toList();
    });
  }

  @override
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
                ...dados.map((item) => CustomCard(
                      nome: item['nome']!,
                      valor: item['valor']!,
                      imagem: item['imagem']!,
                      restaurante_id: item['restaurante_id']!,
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
}
