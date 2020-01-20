import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(const Test2());
}

class Test2 extends StatelessWidget {
  const Test2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.blue,
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Here is your lucky number that never changes',
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                ClipPath(
                  clipper: const BeamClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 1.5,
                        colors: <Color>[
                          Colors.yellow,
                          Colors.transparent,
                        ],
                        stops: <double>[0, _controller.value],
                      ),
                    ),
                  ),
                ),
                FutureBuilder<int>(
                  future: getRandom(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '${snapshot.data}',
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Icon(Icons.error),
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// this method should not be changed
Future<int> getRandom() async {
  return Random().nextInt(1000000) + 60000;
}
