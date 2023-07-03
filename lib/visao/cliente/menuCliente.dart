import 'package:flutter/material.dart';
import 'package:for_food/visao/cliente/pedidoCliente.dart';
import 'package:for_food/visao/cliente/minhaContaCliente.dart';
import 'package:for_food/visao/cliente/principalCliente.dart';

class MenuCliente extends StatefulWidget {
  int _opcao;

  // Construtor passando o índice da tela selecionada
  MenuCliente(this._opcao);

  @override
  _MenuClienteState createState() => _MenuClienteState(this._opcao);
}

class _MenuClienteState extends State<MenuCliente> {
  // Construtor
  _MenuClienteState(this._opcao);

  int _opcao;
  int _selectedIndex = 0;

  final List<Widget> _stOptions = <Widget>[
    PrincipalCliente(),
    PedidoCliente(),
    MinhaContaCliente(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: _selectedIndex,
                children: _stOptions,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _selectedIndex == 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: AppBar(
                  title: const Text("Cardapio"),
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.purple,
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Cardapio',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.attach_money),
                      label: 'Meus pedidos',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.money_off),
                      label: 'Minha Conta',
                    ),
                  ],
                  unselectedItemColor: Colors.white,
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                  onTap: _onItemTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
