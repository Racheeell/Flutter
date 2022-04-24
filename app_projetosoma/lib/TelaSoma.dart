import 'package:flutter/material.dart';

class TelaSoma extends StatefulWidget {
  const TelaSoma({Key? key}) : super(key: key);

  @override
  _TelaSomaState createState() => _TelaSomaState();
}

class _TelaSomaState extends State<TelaSoma> {
  TextEditingController txtv1 = new TextEditingController();
  TextEditingController txtv2 = new TextEditingController();

  int v1, v2, total = 0;

  void CalcularTotal() {
    setState(() {
      v1 = int.parse(txtv1.text);
      v2 = int.parse(txtv2.text);

      total = v1 + v2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Projeto Revisão"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: txtv1,
                //text, number, email, datetime
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite um valor",
                  enabled: true,
                ),
              ),
              TextField(
                controller: txtv2,
                //text, number, email, datetime
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Digite um valor", enabled: true),
              ),
              Text(
                "O total é: $total",
                style: TextStyle(fontSize: 25),
              ),
              RaisedButton(
                onPressed: CalcularTotal,
                color: Colors.blue,
                child: Text(
                  "Calcular Total",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ));
  }
}
