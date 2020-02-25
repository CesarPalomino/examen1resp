import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_pago.dart';

import '../home/home.dart';
import '../profile.dart';
import '../utils/constants.dart';

class PagoPage extends StatefulWidget {
  PagoPage({Key key}) : super(key: key);

  @override
  _PagoPageState createState() => _PagoPageState();
}

class _PagoPageState extends State<PagoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: COLOR_7,), onPressed: null),
        title: Text("Pagos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDialog,
            child: ItemPago(
              title: "tarjeta de credito",
              image: "http://prints.ultracoloringpages.com/26394191ee3b0e1409d127324c3a5d56.png",
            ),
          ),
          GestureDetector(
            onTap: _openDialog,
              child: ItemPago(
                title: "PayPal",
                image: "https://www.paypalobjects.com/webstatic/icon/pp258.png",
            ),
          ),
          ItemPago(
            title: "Tarjeta de regalo",
            image:
                "https://i.ya-webdesign.com/images/gift-card-png-3.png",
          ),
        ],
      ),
    );
  }

  Future<void> _openDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.network(
            'https://dam.cocinafacil.com.mx/wp-content/uploads/2018/08/beneficios-de-tomar-cafe.jpg',
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.beenhere), onPressed: () {}),
                    Column(
                      children: <Widget>[
                        Text("¡Orden exitosa!"),
                        Text("Taza Cupping"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                    "Tu orden ha sido registrada, para mas informacion buscar en la opcion historial de compras en tu perfil.")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ACEPTAR'),
              onPressed: () {
                Navigator.of(context).pop(Home(title: APP_TITLE));
              },
            ),
          ],
        );
      },
    );
  }

}