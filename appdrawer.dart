import 'package:flutter/material.dart';

import './main.dart';
import './about.dart';
import './developer.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.blue[400],
            height: 170,
            width: double.infinity,
            alignment: FractionalOffset.bottomLeft,
            //  padding: EdgeInsets.all(10),
            child: Text(
              "DSC demo app",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            alignment: FractionalOffset.topLeft,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(MyApp.route);
              },
              icon: Icon(Icons.home),
              label: Text("Home"),
            ),
          ),
          Divider(),
          Container(
            alignment: FractionalOffset.topLeft,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(About.route);
              },
              icon: Icon(Icons.info),
              label: Text("About us"),
            ),
          ),
          Container(
            alignment: FractionalOffset.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Developer.route);
              },
              child: Text("Developer info"),
            ),
          )
        ],
      ),
    );
  }
}
