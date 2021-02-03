import 'package:avadanlik/pages/productDetails.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //Creating maps
  //Created two different price variables so customer can see the difference between actual price and rental
  var productList = [
    {
      "name": "Çim\nBiçme\nMakinesi",
      "picture": "images/products/Alpina Benzinli Çim Biçme Makinesi.jpg",
      "price": 5319,
      "rent_price": 53.19,
    },
    {
      "name": "Teknisyen\nTakım\nÇantası ",
      "picture": "images/products/Teknisyen Takım Çantası.jpg",
      "price": 239.99,
      "rent_price": 2.3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodPrice: productList[index]['price'],
            prodRentPrice: productList[index]['rent_price'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodPrice;
  final prodRentPrice;

  SingleProd({
    this.prodName,
    this.prodPicture,
    this.prodPrice,
    this.prodRentPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //Hero widget is for transition between images
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //here we are passing the values of the product to the product details page
                  builder: (context) => new ProductDetails(
                        productDetailName: prodName,
                        productDetailRentPrice: prodRentPrice,
                        productDetailPrice: prodPrice,
                        productDetailPicture: prodPicture,
                      ))),
              child: GridTile(
                  footer: Container(
                    height: 70,
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\₺$prodRentPrice",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\₺$prodPrice",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationThickness: 1.2,
                        ),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prodPicture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
