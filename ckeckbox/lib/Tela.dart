import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  bool ckborda = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exemplo checkbox"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Text("Borda recheada"),
          Checkbox(
            value: ckborda,
            activeColor: Colors.black,
            onChanged: (bool valor) {
              setState(() {
                ckborda = valor;
              });
            },
          ),
          CheckboxListTile(
              title: Text("Borda recheada - R"),
              value: value,
              onChanged: onChanged)
        ])));
  }
}
