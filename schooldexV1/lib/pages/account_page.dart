import 'package:flutter/material.dart';

class Accountpage extends StatelessWidget {
  static const routeName = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.person,
                size: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
