import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailRentPrice;
  final productDetailPrice;
  final productDetailPicture;

  ProductDetails(
      {this.productDetailName,
      this.productDetailRentPrice,
      this.productDetailPrice,
      this.productDetailPicture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: Text('Avadanlık'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white70,
                  //We have to give reference to base class because this is sub class of State
                  child: Image.asset(widget.productDetailPicture)),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                              "Liste Fiyatı:" +
                                  "" +
                                  "\₺${widget.productDetailPrice}",
                              style: TextStyle(
                                color: Colors.black,
                              ))),
                      Expanded(
                          child: new Text(
                              "Günlük kira:" +
                                  ""
                                      "\₺${widget.productDetailRentPrice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ======== 1st button ========

          Row(
            children: <Widget>[
              // ======== the brand button =====
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 1,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Adet")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              // ======== the brand button =====
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    elevation: 1,
                    child: new Text("Kirala")),
              ),
              new IconButton(
                  icon:
                      Icon(Icons.add_shopping_cart, color: Colors.orangeAccent),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.orangeAccent),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
