import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import './appdrawer.dart';

class About extends StatelessWidget {
  static const route = "./About";

  void _dscweb(BuildContext ctx) async {
    const url = "https://dscsastra.com";
    if (await canLaunch(url)) {
      await launch(url);
      print("nakkul");
    } else {
      return showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text('error'),
            content: Text('check your network connection'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Container(
                child: Image.asset("asset/images/dsc.jpg"),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  "Developer Student Clubs is a community where everyone is welcome.We help students bridge the gap between theory and practice and grow their knowledge by providing a peer to peer learning environment, by conducting workshop,study jams and building solution for local buisness.Developer Student Clibs is a program supported by google developers ")),
          RaisedButton(
            onPressed: () {
              _dscweb(context);
            },
            child: Text("visit dscsastra.com"),
          )
        ],
      ),
    );
  }
}
