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
    {
      "name": "Alüminyum Merdiven",
      "picture": "images/products/Saraylı Alüminyum Merdiven 6+1 Basamak.jpg",
      "product_brand": "Saraylı",
      "price": 579.90,
      "rent_price": 5.79,
      "product_specs":
          "Saraylı Alüminyum Merdiven, güçlendirilmiş ayak desteği ile ev ve işyerlerinde kullanıma uygun ihtiyaçlarınızı karşılayacak ideal bir üründür. \n\n-Tipi: A Tipi\n-Basamak Sayısı: 7 Basamaklı\n-Açık Ölçü: 148x120 cm\n-Kapalı Ölçü: 	223x51x10 cm"
    },
    {
      "name": "Kaynak Makinesi",
      "picture":
          "images/products/KL PRO İnverter Kaynak Makinesi 200A KLMMA200.jpg",
      "product_brand": "KL-PRO",
      "price": 1749.90,
      "rent_price": 17.49,
      "product_specs":
          "KL PRo Inverter Kaynak Makinesi 200A KLMMA200, 8,0 kVA gücü ile yüksek performans vadeder. Ürünün giriş gücü 230 volt olup, boşta çalışma voltajı ise 75 volttur. \n\n-Güç: 8,0 kVA\n-Giriş Gücü: 230 Volt\n-Çalışma Verimliliği: 200A 60%\n-Boşta Çalışma Voltajı: 	75 Volt"
    },
    {
      "name": "Basınçlı Yıkama Makinesi ",
      "picture":
          "images/products/Black&Decker BXPW1500E Basınçlı Yıkama Makinesi.jpg",
      "product_brand": "Black&Decker",
      "price": 849.90,
      "rent_price": 8.49,
      "product_specs":
          "Black&Decker BXPW1500E Basınçlı Yıkama Makinesi, yüksek basınçla sıkıştırılan suyun dar bir hortum ağzından püskürtmesi ile çeşitli alet ve araçların temizlenmesini sağlar. \n\n-Güç: 1500 Watt\n-Basınçlı Yıkama Debisi: 120 Bar\n-Buhar Basıncı: 120 Bar\n-Hortum Uzunluğu: 	6 Metre"
    },
    {
      "name": "Dekupaj Testere",
      "picture": "images/products/Bosch Dekupaj Testere 710W GST8000E.jpg",
      "product_brand": "Bosch",
      "price": 799.99,
      "rent_price": 7.9,
      "product_specs":
          "Bosch Dekupaj Testere 710W GST8000E, profesyonel kullanıma yönelik tasarlanmış Bosch Dekupaj Testere, sağlam çelik taban levhası ile fark yaratır. Yüksüz hızı 500-3100 dev/dk'dır. \n\n-Güç: 710 Watt\n-Yüksüz Hızı dev/dk: 	500-3100 dev/dk\n-Kesme Derinliği Ahşap: 	80 mm\n-Kesme Derinliği Çelik: 	10 mm"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: SingleProd(
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodPrice: productList[index]['price'],
              prodRentPrice: productList[index]['rent_price'],
              prodSpecs: productList[index]['product_specs'],
              prodBrand: productList[index]['product_brand'],
            ),
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
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
