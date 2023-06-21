import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PedidosProprietario extends StatefulWidget {
  @override
  _PedidosProprietarioState createState() => _PedidosProprietarioState();
}

class _PedidosProprietarioState extends State<PedidosProprietario> {
  List<String> pedidos = [
    "Pedido 1",
    "Pedido 2",
    "Pedido 3",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos do Cliente Atual"),
        backgroundColor: Colors.deepPurple[800], // Define a cor roxa mais escura para a barra superior
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pedidos[index]),
            subtitle: Text("Status: Pendente"),
            trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Lógica para marcar o pedido como concluído
                setState(() {
                  pedidos.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
