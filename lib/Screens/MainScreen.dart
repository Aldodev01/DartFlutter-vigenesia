import 'dart:async';
import 'dart:convert';
import 'package:vigenesia/Screens/EditPage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'Login.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:another_flushbar/flushbar.dart';

class MainScreens extends StatefulWidget {
  final String? nama;
  const MainScreens({Key? key, this.nama}) : super(key: key);
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  TextEditingController isiController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
// <-- Berfungsi Untuk Bisa Scroll
        child: SafeArea(
// < -- Biar Gak Keluar Area Screen HP
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // <-- Berfungsi untuk atur nilai X jadi tengah
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hallo",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            child: Icon(Icons.logout),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new Login()));
                            })
                      ],
                    ),
                    SizedBox(height: 20), // <-- Kasih Jarak Tinggi : 50px
                    FormBuilderTextField(
                      controller: isiController,
                      name: "isi_motivasi",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            Timer(
                              Duration(seconds: 2),
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const EditPage(),
                                ),
                              ),
                            );
                          },
                          child: Text("Submit")),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      child: Icon(Icons.refresh),
                      onPressed: () {
                        Timer(
                          Duration(seconds: 3),
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          ),
                        );
                        // _getData();
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
