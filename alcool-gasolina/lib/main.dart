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
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String resultado = "";

  void _calcular() {
    double Etanol = double.tryParse(etanolController.text) ?? 0;
    double Gasolina = double.tryParse(gasolinaController.text) ?? 0;

    double ratio = Etanol / Gasolina;

    setState(() {
      if (ratio < 0.7) {
        resultado = "Abasteça com etanol";
      } else {
        resultado = "Abasteça com gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          _campo(etanolController, "Preço do Etanol"),
          _campo(gasolinaController, "Preço da Gasolina"),
          _button(),
          _resultado(),
        ],
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrgaTu-9iPX89LJ4VE-niMQvKGWqCTnZiSLA&usqp=CAU',
        height: 150,
        width: 150,
      ),
    );
  }

  _campo(TextEditingController controller, String labelText) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.pink),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controller,
    );
  }

  _resultado() {
    return Text(
      resultado,
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      onPressed: _calcular,
      child: Text(
        "Calcular",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
