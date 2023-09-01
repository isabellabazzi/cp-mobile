import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _contadorPessoas = 0;

  _atualizarContador(String title) {
    setState(() {
      if (title == "+")
        _contadorPessoas++;
      else if (_contadorPessoas > 0) _contadorPessoas--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contador de Pessoas"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _contador(),
          SizedBox(height: 16),
          _button("+"),
          SizedBox(height: 36),
          _button("-"),
        ],
      ),
    );
  }

  _contador() {
    return Text(
      '$_contadorPessoas',
      style: TextStyle(
        color: Colors.pink,
        fontSize: 144,
      ),
    );
  }

  _button(title) {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: title == "+" ? Colors.purple : Colors.pink,
        ),
        onPressed: () {
          _atualizarContador(title);
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
