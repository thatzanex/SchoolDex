import 'package:flutter/material.dart';
import '../widgets/account_bottom.dart';

class Accountpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
