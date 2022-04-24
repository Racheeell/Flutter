import 'package:flutter/material.dart';

import 'Tela02.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: RaisedButton(
          child: Text(
            "Ir para a tela 02",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tela02()));
          },
        ),
      ),
    );
  }
}
