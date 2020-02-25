import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pago_page.dart';

import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';

class ItemCupDetails extends StatefulWidget {
  final Map<String, List> products;

  final int index;

  const ItemCupDetails({Key key, this.products, this.index}) : super(key: key);

  @override
  _ItemCupDetailsState createState() => _ItemCupDetailsState();
}

class _ItemCupDetailsState extends State<ItemCupDetails> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.products["Tazas"][widget.index].productTitle}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            "${widget.products["Tazas"][widget.index].productImage}",
                            fit: BoxFit.fitHeight,
                            height: 180,
                          ),
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: IconButton(
                              icon: Icon(Icons.favorite,
                                  color: widget
                                          .products["Tazas"][widget.index].liked
                                      ? COLOR_5
                                      : PRIMARY_COLOR),
                              onPressed: () {
                                setState(() {
                                  widget.products["Tazas"][widget.index].liked =
                                      !widget.products["Tazas"][widget.index]
                                          .liked;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "${widget.products["Tazas"][widget.index].productTitle}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "${widget.products["Tazas"][widget.index].productDescription}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "TAMAÑOS DISPONIBLES",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\$${widget.products["Tazas"][widget.index].productPrice.ceil()}",
                      style: Theme.of(context).textTheme.display2.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.free_breakfast, color: Colors.grey,),
                      onPressed: () {
                        null;
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.free_breakfast, color: COLOR_5,),
                      onPressed: () {
                        null;
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.free_breakfast, color: PRIMARY_COLOR),
                      onPressed: () {
                        null;
                      },
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    child: Text('AGREGAR AL CARRITO'),
                    color: COLOR_3,
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ), // New code
                    onPressed: () {
                      setState(() {
                        widget.products["Tazas"][widget.index].productAmount +=
                            1;
                        widget.products["Carrito"].add(ProductCart.productCD(
                            widget.products["Tazas"][widget.index]));
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text('COMPRAR AHORA'),
                    color: COLOR_3,
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ), // New code
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PagoPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
