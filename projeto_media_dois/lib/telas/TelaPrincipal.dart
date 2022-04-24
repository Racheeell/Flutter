//importa o pacote
import'package:flutter/material.dart';

//stless cria uma classe
//stfull cria duas classe

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Aplicativo de Média"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
         children: <Widget>[

           TextField(
             keyboardType: TextInputType.number,
             style: TextStyle(fontSize: 20),
             decoration: InputDecoration(
               labelText: "Nota01",
               labelStyle: TextStyle(color: Colors.teal),
             ),
             textAlign: TextAlign.center,
           ),

           TextField(
             keyboardType: TextInputType.number,
             style: TextStyle(fontSize: 20),
             decoration: InputDecoration(
               labelText: "Nota02",
               labelStyle: TextStyle(color: Colors.teal),
             ),
             textAlign: TextAlign.center,
           ),
           TextField(
             keyboardType: TextInputType.number,
             style: TextStyle(fontSize: 20),
             decoration: InputDecoration(
               labelText: "Nota03",
               labelStyle: TextStyle(color: Colors.teal),
             ),
             textAlign: TextAlign.center,
           ),
         ]
        )

      )
    );
  }
}

