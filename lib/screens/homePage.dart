//custom imports
import 'package:avadanlik/commons/common.dart';
import 'package:avadanlik/components/HorizantalListView.dart';

import 'package:avadanlik/provider/app_provider.dart';
import 'package:avadanlik/provider/product_provider.dart';

import 'package:avadanlik/provider/user_provider.dart';
import 'package:avadanlik/widgets/product_card.dart';

import '../screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // AppProvider appProvider = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final user = Provider.of<UserProvider>(context);
    Widget image_carousel = new Container(
      height: 181.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/r1.jpg'),
          AssetImage('images/r3.jpeg'),
          AssetImage('images/r2.jpg'),
          AssetImage('images/r4.jpg'),
          AssetImage('images/r5.jpg'),
          AssetImage('images/r6.jpg'),
        ],
        autoplay: true,
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: deepOrange),
        elevation: 0.1,
        backgroundColor: white,
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[50],
          elevation: 0.0,
          child: TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
                hintText: "Ürün girin...", border: InputBorder.none),
            validator: (value) {
              if (value.isEmpty) {
                return "Lütfen arama alanını doldurun.";
              }
              return null;
            },
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: deepOrange), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: deepOrange),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartScreen()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Admin'),
              accountEmail: Text('avadanlik@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.yellow],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Ana Sayfa'),
                    leading: Icon(Icons.home, color: Colors.grey))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Hesabım'),
                    leading: Icon(Icons.person, color: Colors.grey))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Kiraladıklarım'),
                    leading: Icon(Icons.shopping_basket, color: Colors.grey))),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new CartScreen()));
                },
                child: ListTile(
                    title: Text('Sepetim'),
                    leading: Icon(Icons.shopping_cart, color: Colors.grey))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Beğendiklerim'),
                    leading: Icon(Icons.favorite, color: Colors.grey))),
            Divider(color: Colors.black),
            InkWell(
                onTap: () {},
                child: ListTile(
                    title: Text('Ayarlar'),
                    leading: Icon(Icons.settings, color: Colors.grey))),
            InkWell(
              onTap: () {
                user.signOut();
                // FirebaseAuth.instance.signOut().then((value) {
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => Login()));
                // });
              },
              child: ListTile(
                title: Text('Çıkış'),
                leading: Icon(
                  Icons.transit_enterexit,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carousel starts here
          image_carousel,
          //Padding Widget
          new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Text(
              'Kategoriler',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.black,
              ),
            ),
            //Horizantal list view starts here
          ),
          HorizantalList(),
          //Padding widget
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              'Kiralık Aletler',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1
                  ..color = Colors.black,
              ),
            ),
          ),
          // FeaturedProducts(),

          Column(
            children: productProvider.products
                .map((item) => GestureDetector(
                      child: ProductCard(
                        product: item,
                      ),
                    ))
                .toList(),
          )
          //  Flexible(child: Products()),
        ],
      ),
    );
  }
}
