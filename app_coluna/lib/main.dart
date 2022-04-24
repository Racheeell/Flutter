import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TelaColuna(),
  ));
}

class TelaColuna extends StatefulWidget {
  const TelaColuna({Key? key}) : super(key: key);

  @override
  _TelaColunaState createState() => _TelaColunaState();
}

class _TelaColunaState extends State<TelaColuna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Coluna"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text(
              "Texto 1",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Texto 2",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Texto 3",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
