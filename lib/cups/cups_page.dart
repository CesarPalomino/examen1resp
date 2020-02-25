import 'package:flutter/material.dart';

import '../cart/cart.dart';
import '../profile.dart';
import 'item_cup.dart';
import 'item_cup_details.dart';

class CupsPage extends StatelessWidget {
  final Map<String, List> productsMap;
  CupsPage({
    Key key,
    @required this.productsMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tazas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
             if (productsMap["CART"].length == 0) {
                print("NOSE PUEDE");
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => Cart(productsCart: productsMap["Carrito"]),
                ));
            }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsMap["Tazas"].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ItemCupDetails(products: productsMap,index: index)));
              },
              child:(
                ItemCups(Cup: productsMap["Tazas"][index])
              ));
        },
      ),
    );
  }
}
