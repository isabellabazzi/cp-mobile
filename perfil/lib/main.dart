import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu Perfil"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Text(
            "Nome: Isabella Bazzi \n\nFormação: Sistemas para Internet - FIAP \n\nExperiência: Analista Ecommerce \n\n ",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
