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
      "name": "Çim Biçme Makinesi",
      "picture": "images/products/Alpina Benzinli Çim Biçme Makinesi.jpg",
      "product_brand": "Alpina",
      "price": 5319,
      "rent_price": 53.19,
      "product_specs":
          "Benzinli Çim Biçme Makinesi ürünü bahçenizdeki istemediğiniz bitki ve çimleri biçmek için idealdir.\n\n-Modeli: Benzinli Çim Biçme Makinesi\n-Silindir Hacmi: 160cc\n-Kesme Genişliği: 51cm\n-Kesme Yüksekliği: 25-90cm"
    },
    {
      "name": "Teknisyen Takım Çantası ",
      "picture": "images/products/Teknisyen Takım Çantası.jpg",
      "product_brand": "Super-Bag",
      "price": 239.99,
      "rent_price": 2.3,
      "product_specs":
          "Teknisyen Takım Çantası, teknik ve hobby amaçlı kullanıma uygun sağlam ve dayanıklı bir üründür. \n\n-Malzeme: Sağlam dayanımı yüksek copolimer hammadde\n-Yükseklik: 18 cm\n-Genişlik: 48 cm\n-Derinlik: 	39,8 cm"
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
            prodSpecs: productList[index]['product_specs'],
            prodBrand: productList[index]['product_brand'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodPrice;
  final prodRentPrice;
  final prodSpecs;
  final prodBrand;

  SingleProd({
    this.prodName,
    this.prodPicture,
    this.prodPrice,
    this.prodRentPrice,
    this.prodSpecs,
    this.prodBrand,
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
                        productDetailSpecs: prodSpecs,
                        productDetailBrand: prodBrand,
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
