import 'package:avadanlik/components/products.dart';
import 'package:flutter/material.dart';
import 'package:avadanlik/main.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailRentPrice;
  final productDetailPrice;
  final productDetailPicture;
  final productDetailSpecs;
  final productDetailBrand;

  ProductDetails(
      {this.productDetailName,
      this.productDetailRentPrice,
      this.productDetailPrice,
      this.productDetailPicture,
      this.productDetailSpecs,
      this.productDetailBrand});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('Avadanlık')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Adet"),
                            content: new Text("Adet belirleyin"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Kapat",
                                    style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          );
                        });
                  },
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
              // ======== the rent button =====
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
          Divider(color: Colors.black54),
          new ListTile(
            title: new Text("Ürün Detayı"),
            subtitle: new Text(widget.productDetailSpecs),
          ),
          Divider(color: Colors.black54),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Ürün Adı:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailName),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Ürün Markası:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailBrand),
              )
            ],
          ),
          //PRODUCT CONDITION
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Ürün Durumu:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Yeni"),
              )
            ],
          ),
          Divider(
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: new Text("Benzer Ürünler"),
            //SIMILAR PRODUCTS SECTION
          ),
          Container(
            height: 360,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
    {
      "name": "Alüminyum Merdiven",
      "picture": "images/products/Saraylı Alüminyum Merdiven 6+1 Basamak.jpg",
      "product_brand": "Saraylı",
      "price": 579.90,
      "rent_price": 5.79,
      "product_specs":
          "Saraylı Alüminyum Merdiven, güçlendirilmiş ayak desteği ile ev ve işyerlerinde kullanıma uygun ihtiyaçlarınızı karşılayacak ideal bir üründür. \n\n-Tipi: A Tipi\n-Basamak Sayısı: 7 Basamaklı\n-Açık Ölçü: 148x120 cm\n-Kapalı Ölçü: 	223x51x10 cm"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProd(
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

class SimilarSingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodPrice;
  final prodRentPrice;
  final prodSpecs;
  final prodBrand;

  SimilarSingleProd({
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
          tag:
              prodName, //Tag name should be changed if you are going to insert the same product
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
                      color: Colors.white70,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              prodName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          new Text(
                            "\₺${prodRentPrice}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prodPicture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
