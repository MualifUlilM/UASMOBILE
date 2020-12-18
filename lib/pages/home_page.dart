import 'package:flutter/material.dart';
import 'package:uas/component/component.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'CRUD Apps',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'We Take Your Data',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            ButtonComponent(
                label: "Get Started",
                onTap: () => Navigator.pushNamed(context, '/input'))
          ],
        ),
      ),
    );
  }
}
