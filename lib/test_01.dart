import 'package:flutter/material.dart';

void main() => runApp(const Test1());

class Test1 extends StatelessWidget {
  const Test1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(int.parse('#F44336')),
        accentColor: Color(int.parse('#2196F3')),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  void _displaySnackBar(BuildContext context) {
    const SnackBar snackBar = SnackBar(content: Text('Are you talking to me?'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 01'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(helperText: 'Enter App ID'),
                  style: Theme.of(context).textTheme.body1,
                )
              ],
            ),
            RaisedButton(
              color: Colors.pink,
              textColor: Colors.white,
              onPressed: () {
                _displaySnackBar(context);
              },
              child: const Text('Display SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: unused_element
