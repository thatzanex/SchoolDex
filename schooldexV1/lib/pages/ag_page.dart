import 'package:flutter/material.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class AGPage extends StatefulWidget {
  @override
  _AGPageState createState() => _AGPageState();
}

class _AGPageState extends State<AGPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AG Angebot'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: Text('AGs'),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.white, Colors.white, Colors.orange, Colors.white),
    );
  }
}
