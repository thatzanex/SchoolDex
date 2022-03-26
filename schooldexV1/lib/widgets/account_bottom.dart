import 'package:flutter/material.dart';

class MyAccountbottom extends StatelessWidget {
  void selectPagetoAccount(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/account');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => selectPagetoAccount(context),
      icon: Icon(Icons.person),
      iconSize: 40,
    );
  }
}
