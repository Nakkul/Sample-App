import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import './appdrawer.dart';
import './about.dart';
import './developer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   static const route="MyApp";
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
 
  List<String> datas = [];

  Future<void> item() async {
    final url = "https://wayhike.com/dsc/demo_app_api.php";
    final data = await http.get(url);
    final items = json.decode(data.body) as Map<String, dynamic>;
    final List<String> extracteddata = [];
    items.forEach((key, value) {
      for (int i = 0; i < items['event_titles'].length; i++)
        extracteddata.add(value[i]);
    });
    
    setState(() {
      datas = extracteddata;
    });
  }

  @override
  void initState() {
    item();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size=MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text("DSC"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (ctx, index) {
          return Padding(
              padding: EdgeInsets.all(17),
              child: Container(
                  height: 50,
                  child: Card(
               
                    elevation: 20,
                    child: Center(child: Text(datas[index],),),
                  ),),);
        },
      ),
      drawer: AppDrawer(),
    ),
    routes: {
About.route:(ctx)=>About(),
MyApp.route:(ctx)=>MyApp(),
Developer.route:(ctx)=>Developer()

    },);
  }
}
