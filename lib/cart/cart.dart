import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/pago_page.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';

import '../profile.dart';
import 'item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductCart> productsCart;
  Cart({
    Key key,
    @required this.productsCart,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var it in widget.productsCart) {
      _total += (it.productPrice * it.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carito"),
        actions: <Widget>[
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
      body: Padding(
          padding: EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: widget.productsCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCart(
                        shiree: _shiree,
                        f5: _f5,
                        productCart: widget.productsCart[index],
                      );
                    },
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Total\n \$$_total MX",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                flex: 1,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("PAGAR"),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PagoPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void _f5(double sumar) {
    setState(() {
      _total += sumar;
    });
  }

  void _shiree(bool b) {
    setState(() {
      for (int i = 0; i < widget.productsCart.length; i++) {
        if (widget.productsCart[i].remove == true) {
          widget.productsCart[i].productAmount = 0;
          _f5(-_total);
          widget.productsCart.removeAt(i);
          break;
        }
      }
    });
  }
}
