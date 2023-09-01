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
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  String resultado = "";

  void _calcular() {
    setState(() {
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);

      int result = num1 * num2;

      resultado = "O resultado é: $result";
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
          title: Text("Multiplicador de Números"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Digite o primeiro valor", num1Controller),
          SizedBox(height: 10),
          _campo("Digite o segundo valor", num2Controller),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 16),
          _texto(),
        ],
      ),
    );
  }

  _campo(String title, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: title, labelStyle: TextStyle(color: Colors.purple)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.pink, fontSize: 25.0),
      controller: controller,
    );
  }

  _texto() {
    return Text(
      resultado,
      style: TextStyle(
        color: Colors.purple,
        fontSize: 28,
        fontWeight: bold,
      ),
    );
  }

  _button() {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
        ),
        onPressed: () {
          _calcular();
        },
        child: Text(
          "Calcular",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
