import 'dart:convert';

import 'package:belajar/model_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleHttp extends StatefulWidget {
  final String data;
  const SimpleHttp({super.key, required this.data});

  @override
  State<SimpleHttp> createState() => _SimpleHttpState();
}

class _SimpleHttpState extends State<SimpleHttp> {
  // List<dynamic> list = [];
  List<Product> listProduk = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getService();
    print("data ${widget.data}");
  }

  void getService() async {
    var url = Uri.https('api.restful-api.dev', '/objects');

    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // setState(() {
      //   list = jsonDecode(response.body);
      // });

      setState(() {
        listProduk = (jsonDecode(response.body) as List)
            .map((json) => Product.fromJson(json))
            .toList();
      });
    }else{
      print("Something went wrong");
    }

    // print(list);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Http"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listProduk.length,
          itemBuilder: (context, index) {
            return Text(listProduk[index].name);
          },
        ),
      ),
    );
  }
}


// ListView.builder(
// itemCount: list.length,
// itemBuilder: (context, index) {
// return Text(list[index]['name']);
// },
// ),