// import 'package:flutter/material.dart';

// // my imports
// import 'package:avadanlik/components/cart_products.dart';

// class Cart extends StatefulWidget {
//   @override
//   _CartState createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: new AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepOrange, Colors.yellow],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),
//         ),
//         title: Text('Sepet'),
//         actions: <Widget>[
//           new IconButton(
//               icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
//         ],
//       ),
//       body: new CartProducts(),
//       bottomNavigationBar: new Container(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//                 child: ListTile(
//               title: new Text("Toplam:"),
//               subtitle: new Text("\₺230"),
//             )),
//             Expanded(
//               child: new MaterialButton(
//                 onPressed: () {},
//                 child: new Text(
//                   "Ödeme",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 color: Colors.deepOrange,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:avadanlik/commons/common.dart';
import 'package:avadanlik/commons/loading.dart';
import 'package:avadanlik/models/cart_item.dart';
import 'package:avadanlik/provider/app_provider.dart';
import 'package:avadanlik/provider/user_provider.dart';
import 'package:avadanlik/service/orders.dart';
import 'package:avadanlik/widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Alışveriş Sepeti"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: appProvider.isLoading
          ? Loading()
          : ListView.builder(
              itemCount: userProvider.userModel?.cart?.length ?? 0,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red.withOpacity(0.2),
                                offset: Offset(3, 2),
                                blurRadius: 30)
                          ]),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            child: Image.network(
                              userProvider.userModel.cart[index].image,
                              height: 120,
                              width: 140,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: (userProvider.userModel
                                                      ?.cart[index]?.name ??
                                                  '') +
                                              "\n",
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              "\₺${(userProvider.userModel?.cart[index]?.rent ?? 0)} \n\n",
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300)),
                                    ]),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.deepOrange,
                                    ),
                                    onPressed: () async {
                                      appProvider.changeIsLoading();
                                      bool success =
                                          await userProvider.removeFromCart(
                                              cartItem: userProvider
                                                  .userModel.cart[index]);
                                      if (success) {
                                        userProvider.reloadUserModel();
                                        print("Sepete eklendi!");
                                        _key.currentState.showSnackBar(SnackBar(
                                            content:
                                                Text("Sepetten kaldırıldı!")));
                                        appProvider.changeIsLoading();
                                        return;
                                      } else {
                                        appProvider.changeIsLoading();
                                      }
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Toplam: ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text:
                          " \₺${userProvider.userModel?.totalCartPrice ?? 0 / 100}",
                      style: TextStyle(
                          color: black,
                          fontSize: 22,
                          fontWeight: FontWeight.normal)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: deepOrange),
                child: FlatButton(
                    onPressed: () {
                      if (userProvider.userModel.totalCartPrice == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Sepetiniz boş',
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                        return;
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Siparişiniz üzerine \₺${userProvider.userModel.totalCartPrice} ödeyeceksiniz!',
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            if (userProvider.userModel == null)
                                              return;
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: userProvider.user.uid,
                                                id: id,
                                                description: "Sipariş Tarihi",
                                                status: "tamamlandı",
                                                totalPrice: userProvider
                                                    .userModel.totalCartPrice,
                                                cart: userProvider
                                                    .userModel.cart);
                                            for (CartItemModel cartItem
                                                in userProvider
                                                    .userModel.cart) {
                                              bool value = await userProvider
                                                  .removeFromCart(
                                                      cartItem: cartItem);
                                              if (value) {
                                                userProvider.reloadUserModel();
                                                print("Ürün sepete eklendi!");
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Ürünler Sepetten kaldırıldı!")));
                                              } else {
                                                print("ÜRÜN KALDIRILMADI!");
                                              }
                                            }
                                            _key.currentState.showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Sipariş oluşturuldu!")));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Kabul et",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Reddet",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: CustomText(
                      text: "Ödeme",
                      size: 20,
                      color: white,
                      weight: FontWeight.normal,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
