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
      extendBodyBehindAppBar: true, // Permite que o corpo da tela se estenda atrás da barra superior
      appBar: _selectedIndex != null
          ? null
          : AppBar(
        backgroundColor: Colors.white, // Define a cor da barra superior como branca
        elevation: 0, // Remove a sombra da barra superior
      ),

      // Corpo da aplicação, aqui são setadas as telas
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Define o fundo do corpo como branco
          ),
          _stOptions.elementAt(_selectedIndex),
        ],
      ),

      // Botões do BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.money_off),
            label: 'Estoque/Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Minha Conta',
          ),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
