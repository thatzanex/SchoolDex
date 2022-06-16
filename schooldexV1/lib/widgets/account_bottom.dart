import 'package:flutter/material.dart';
import 'package:schooldex/pages/settings_page.dart';

class MyAccountbottom extends StatelessWidget {
  const MyAccountbottom({Key? key}) : super(key: key);
  void selectPagetoAccount(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Settingspage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => selectPagetoAccount(context),
      icon: const Icon(Icons.person),
      iconSize: 40,
    );
  }
}
