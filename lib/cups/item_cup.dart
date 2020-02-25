import 'package:flutter/material.dart';

import '../models/product_cup.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';

class ItemCups extends StatefulWidget {
  final ProductCup Cup;
  ItemCups({Key key, @required this.Cup, ti}) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      color: COLOR_2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "${widget.Cup.productTitle}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${widget.Cup.productDescription}",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "\$${widget.Cup.productPrice.ceil()}",
                  style: Theme.of(context).textTheme.display2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      "${widget.Cup.productImage}",
                      fit: BoxFit.fitHeight,
                      height: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.favorite,
                                color: widget.Cup.liked
                                    ? COLOR_5
                                    : PRIMARY_COLOR),
                            onPressed: () {
                              setState(() {
                                widget.Cup.liked = !widget.Cup.liked;
                              });
                            }),
                      ],
                    )
                  ],
                )),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
