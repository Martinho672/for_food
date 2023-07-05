import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:for_food/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final String nome;
  final String imagem;
  final String valor;
  final String restaurante_id;

  const OrderConfirmationScreen({
    Key? key,
    required this.nome,
    required this.imagem,
    required this.valor,
    required this.restaurante_id,
  }) : super(key: key);

  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  int quantidade = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.imagem,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.nome,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.valor,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text('Quantidade: $quantidade'),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantidade > 1) {
                        quantidade--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantidade++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                confirmarPedido(widget.nome, widget.valor, widget.imagem,
                    widget.restaurante_id, quantidade.toString());

                Navigator.pop(context);
              },
              child: const Text('Confirmar Pedido'),
            ),
          ],
        ),
      ),
    );
  }

  void confirmarPedido(String nome, String valor, String imagem,
      String restauranteId, String quantidade) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? clienteId = prefs.getString('usuarioId');

    // Criar um novo documento de pedido
    DocumentReference pedidoRef =
        FirebaseFirestore.instance.collection('pedidos').doc();

    // Dados do pedido
    Map<String, dynamic> pedidoData = {
      'nome': nome,
      'valor': valor,
      'imagem': imagem,
      'restaurante_id': restauranteId,
      'cliente_id': clienteId,
      'quantidade': quantidade,
      'status': 'pendente',
    };

    try {
      // Enviar os dados do pedido para o Firebase Firestore
      await pedidoRef.set(pedidoData);

      // Pedido confirmado com sucesso
      Util().showBar(context, 'Pedido confirmado com sucesso!');
    } catch (e) {
      // Ocorreu um erro ao confirmar o pedido
      print('Erro ao confirmar o pedido: $e');
      Util().showBar(context, 'Houve um erro ao registrar o pedido');
    }
  }
}
