import 'package:flutter/material.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Newspage extends StatefulWidget {
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: Text('Neuigkeiten'),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.orange, Colors.white, Colors.white, Colors.white),
    );
  }
}
