import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import './appdrawer.dart';

class Developer extends StatelessWidget {
  static const route = "./developer";
  void _web(BuildContext ctx, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
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
      appBar: AppBar(title: Text("Developer info")),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Container(
                height: 150,
                child: Center(
                  child: Image.asset(
                    "asset/images/nakkul.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Nakkul Anandh.A",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Mechatronics",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "nakkulanandh230502@gmail.com",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: FractionalOffset.bottomLeft,
                child: Text(
                  "Follow me on:",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                  textAlign: TextAlign.left,
                )),
            RaisedButton(
              color: Colors.orange[200],
              onPressed: () {
                _web(context, "https://www.instagram.com/nakkulanandh/");
              },
              child: Text("Instagram"),
            ),
            SizedBox(
              height: 18,
            ),
            RaisedButton(
              color: Colors.green[200],
              onPressed: () {
                _web(context, "https://github.com/Nakkul");
              },
              child: Text(
                "Github",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
