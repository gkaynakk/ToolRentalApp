import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String gender;
  String groupValue = "erkek";

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/back4.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.black45.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'images/logo.png',
                width: 200,
                height: 150,
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 220.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "İsminiz",
                                icon: Icon(Icons.person_outlined),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "İsim Alanı alanı boş bırakılamaz!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.alternate_email),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Lütfen e-posta adresinizin doğru olduğundan emin olun!';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  "erkek",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Radio(
                                    value: "erkek",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e)),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  "kadın",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Radio(
                                    value: "kadın",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e)),
                              )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Parola",
                                icon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Parola alanı boş bırakılamaz!";
                                } else if (value.length < 6) {
                                  return "Parola en az 6 karakter olmalı!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: "Parolayı onayla",
                                icon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Parola alanı boş bırakılamaz!";
                                } else if (value.length < 6) {
                                  return "Parola en az 6 karakter olmalı!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.orange.withOpacity(0.8),
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Kaydol",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )),
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SignUp()));
                              },
                              child: Text(
                                "Giriş",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                      //
                      // Expanded(child: Container()),
                      // Divider(
                      //   color: Colors.white,
                      // ),
                      // Text(
                      //   "Öbür Giriş Seçenekleri",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 20.0),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8),
                      //     child: Material(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //       color: Colors.red.withOpacity(0.8),
                      //       elevation: 0.0,
                      //       child: MaterialButton(
                      //           onPressed: () {
                      //             handleSignIn();
                      //           },
                      //           minWidth: MediaQuery.of(context).size.width,
                      //           child: Row(
                      //             children: <Widget>[
                      //               Padding(
                      //                 padding: const EdgeInsets.fromLTRB(
                      //                     110, 4, 4, 4),
                      //                 child: Image.asset(
                      //                   'images/google.png',
                      //                   width: 30,
                      //                   height: 30,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 "Google",
                      //                 textAlign: TextAlign.center,
                      //                 style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 20.0),
                      //               ),
                      //             ],
                      //           )),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "erkek") {
        groupValue = e;
      } else if (e == "kadın") {
        groupValue = e;
      } else if (e == "diğer") {
        groupValue = e;
      }
    });
  }
}
