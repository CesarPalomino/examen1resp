import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/grains_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_cart.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String,List> productsMap;
  List<ProductCart> carrito;
  @override
  void initState() {
    // TODO: implement initState
    productsMap = Map();
    carrito = List<ProductCart>();
    productsMap["Bebidas"]=ProductRepository.loadProducts(ProductType.BEBIDAS);
    productsMap["Granos"]=ProductRepository.loadProducts(ProductType.GRANO);
    productsMap["Tazas"]=ProductRepository.loadProducts(ProductType.TAZAS);
    productsMap["Carrito"] = carrito;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: COLOR_7,), onPressed: null),
        title: Text(widget.title),
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
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
              child: ItemHome(
                title: "Cafe en grano",
                image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          ItemHome(
            title: "Tazas",
            image:
                "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
          ),
        ],
      ),
    );
  }

  void _openDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DrinksPage(productsMap: productsMap))
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GrainsPage(productsMap: productsMap))
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DrinksPage(productsMap: productsMap)),
    );
  }
}
