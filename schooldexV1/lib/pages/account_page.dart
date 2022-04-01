import 'package:flutter/material.dart';
import '../widgets/account_bottom.dart';

class Accountpage extends StatelessWidget {
  static const routeName = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5),
            child: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
