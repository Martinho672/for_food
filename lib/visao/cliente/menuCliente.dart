import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_food/visao/cliente/pedidoCliente.dart';
import 'package:for_food/visao/cliente/minhaContaCliente.dart';
import 'package:for_food/visao/cliente/principalCliente.dart';

//indice de seleção da tela
int _selectedIndex = 0;

//vetor de telas a serem utilizadas
List<Widget> _stOptions = <Widget>[
  PrincipalCliente(),
  PedidoCliente(),
  MinhaContaCliente(),
];

class Navegar extends StatefulWidget {
  int _opcao;

  //contrutor passando o indice da tela selecionada
  Navegar(this._opcao);

  @override
  _NavegarState createState() => _NavegarState(this._opcao);
}

class _NavegarState extends State<Navegar> {
  //construtor
  _NavegarState(this._opcao);

  int _opcao;

  @override
  void initState() {
    _selectedIndex = _opcao;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("For Food"),
        backgroundColor: Colors.blue,
      ),

      //corpo da aplicação, aqui são setadas as telas
      body: _stOptions.elementAt(_selectedIndex),

      //botões do BN
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Minha Conta',
          ),
        ],

        unselectedItemColor: Colors.grey,

        currentIndex: _selectedIndex,

        selectedItemColor: Colors.orange,
        //greenAccent,
        onTap:
            _onItemTapped, //chama o métdodo onItemTapped ao clicar no botao do BTNNavigation
      ),
    );
  }

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
