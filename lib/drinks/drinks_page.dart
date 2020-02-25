import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';

import '../cart/cart.dart';
import '../home/home.dart';
import '../profile.dart';
import '../utils/constants.dart';
import 'item_drinks_details.dart';

class DrinksPage extends StatelessWidget {
  final Map<String, List> productsMap;
  DrinksPage({
    Key key,
    @required this.productsMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bebidas"),
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
        itemCount: productsMap["Bebidas"].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ItemDrinkDetails(products: productsMap,index: index)));
              },
              child: ItemDrinks(
                drink: productsMap["Bebidas"][index],
              ));
        },
      ),
    );
  }
}
