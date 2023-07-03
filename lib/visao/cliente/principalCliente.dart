import 'package:flutter/material.dart';

import '../../widgets/customcard.dart';

class PrincipalCliente extends StatefulWidget {
  @override
  _PrincipalClienteState createState() => _PrincipalClienteState();
}

class _PrincipalClienteState extends State<PrincipalCliente> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
              children: const [
                CustomCard(),
                CustomCard(),
                CustomCard(),
                CustomCard(),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
