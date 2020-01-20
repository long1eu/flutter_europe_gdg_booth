import 'package:flutter/material.dart';

void main() => runApp(const Test3());

class Test3 extends StatelessWidget {
  const Test3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test 3'),
        ),
        body: const _Body(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => Scaffold(
                  appBar: AppBar(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    _showConfiguration(context);
  }

  void _showConfiguration(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: const <Widget>[
              Text('This is the new configuration.'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.deepPurpleAccent,
        child: Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: List<Widget>.generate(
              10 * 4,
              (int index) {
                return Container(
                  color: Colors.red,
                  child: Text('$index'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
