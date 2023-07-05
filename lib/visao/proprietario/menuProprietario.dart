import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_food/visao/proprietario/pedidosProprietario.dart';
import 'package:for_food/visao/proprietario/minhaContaProprietario.dart';
import 'package:for_food/visao/proprietario/principalProprietario.dart';
import 'package:for_food/visao/proprietario/estoqueProprietario.dart';

class MenuProprietario extends StatefulWidget {
  int _opcao;

  // Construtor passando o índice da tela selecionada
  MenuProprietario(this._opcao);

  @override
  _MenuProprietarioState createState() => _MenuProprietarioState(this._opcao);
}

class _MenuProprietarioState extends State<MenuProprietario> {
  int _opcao;
  int _selectedIndex = 0;

  // Vetor de telas a serem utilizadas
  List<Widget> _stOptions = <Widget>[
    PrincipalProprietario(),
    PedidosProprietario(),
    EstoqueProprietario(),
    MinhaContaProprietario(),
  ];

  _MenuProprietarioState(this._opcao);

  @override
  void initState() {
    _selectedIndex = _opcao;
    super.initState();
  }

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
                duration: Duration(milliseconds: 200),
                child: AppBar(
                  title: Text("For Food"),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.blue,
                child: BottomNavigationBar(

                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Principal',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.attach_money),
                      label: 'Pedidos Recebidos',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_shopping_cart),
                      label: 'Estoque/Cardapio',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.money_off),
                      label: 'Minha Conta',
                    ),
                  ],
                  backgroundColor: Colors.blue,
                  unselectedItemColor:  Colors.blue,
                  currentIndex: _selectedIndex,
                  selectedItemColor:  Colors.blue,
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
