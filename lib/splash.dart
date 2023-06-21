import 'package:flutter/material.dart';
import 'package:for_food/visao/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Espera 3 segundos do splash
    Future.delayed(Duration(seconds: 3)).then((_) {
      // Muda para a próxima tela (Login)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  // Constrói a tela do splash
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://w7.pngwing.com/pngs/971/466/png-transparent-breakfast-lunch-dinner-meal-breakfast-food-logo-eating-thumbnail.png', // URL para o logotipo online
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
