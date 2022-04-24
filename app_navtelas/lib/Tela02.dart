import 'package:flutter/material.dart';

class Tela02 extends StatefulWidget {
  const Tela02({Key? key}) : super(key: key);

  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 02"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
