import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login.dart';

class Initial extends StatefulWidget {
  Initial({Key key}) : super(key: key);

  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  String marselo =
      "https://previews.123rf.com/images/garloon/garloon1503/garloon150300017/37887938-granos-de-caf%C3%A9-en-la-textura-de-fondo-de-la-tabla.jpghttps://previews.123rf.com/images/garloon/garloon1503/garloon150300017/37887938-granos-de-caf%C3%A9-en-la-textura-de-fondo-de-la-tabla.jpg";
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Image(image: NetworkImage(marselo),height: 300
              ))
        ],
      )),
    );
  }
}
