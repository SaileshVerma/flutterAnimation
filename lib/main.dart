import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Animation(),
    );
  }
}

class Animation extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double w = 200;
  double h = 200;

  void update() {
    setState(() {
      w = 300;
      h = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Click to animate"),
            onPressed: () {
              _controller.repeat();
            },
          ),
          Container(
            width: 350,
            height: 350,
            color: Colors.white,
            child: Center(
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: (ctx, child) => Transform.rotate(
                  angle: _controller.value * 2 * 3.14,
                  child: child,
                ),
                child: Container(
                  //curve: Curves.bounceOut,

                  width: w,
                  height: h,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Searching",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
