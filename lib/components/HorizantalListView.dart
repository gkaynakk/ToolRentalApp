import 'package:flutter/material.dart';

class HorizantalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_caption: 'Akülü Vidalama',
            image_location: 'images/categories/akülü vidalamalar.png',
          ),
          Category(
            image_caption: 'Basınçlı Yıkama',
            image_location: 'images/categories/basınçlı yıkama makineleri.png',
          ),
          Category(
            image_caption: 'Boya Tabancası ve Karıştırıcı',
            image_location:
                'images/categories/boya tabancası ve karıştırıcılar.png',
          ),
          Category(
            image_caption: 'Çim Biçme Makinesi',
            image_location: 'images/categories/çim biçme makinesi.png',
          ),
          Category(
            image_caption: 'İnşaat Makineleri',
            image_location: 'images/categories/inşaat makineleri.png',
          ),
          Category(
            image_caption: 'Kaynak Makineleri',
            image_location: 'images/categories/kaynak makineleri.png',
          ),
          Category(
            image_caption: 'Kırıcılar ve Deliciler',
            image_location: 'images/categories/kırıcılar ve deliciler.png',
          ),
          Category(
            image_caption: 'Matkaplar',
            image_location: 'images/categories/matkaplar.png',
          ),
          Category(
            image_caption: 'Mekanik El Aletleri',
            image_location: 'images/categories/mekanik el aletleri.png',
          ),
          Category(
            image_caption: 'Merdiven',
            image_location: 'images/categories/merdivenler.png',
          ),
          Category(
            image_caption: 'Ölçü Aletleri',
            image_location: 'images/categories/ölçü aletleri.png',
          ),
          Category(
            image_caption: 'Takım Çantaları',
            image_location: 'images/categories/takım çantaları.png',
          ),
          Category(
            image_caption: 'Taşlama',
            image_location: 'images/categories/taşlamalar.png',
          ),
          Category(
            image_caption: 'Testere',
            image_location: 'images/categories/testereler.png',
          ),
          Category(
            image_caption: 'Zımpara ve Polisaj',
            image_location: 'images/categories/zımpara ve polisaj.png',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  //created these object so we can use their construct for each category of tool
  final String image_location;
  final String image_caption;
  Category({this.image_caption, this.image_location});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                )),
          ),
        ),
      ),
    );
  }
}
