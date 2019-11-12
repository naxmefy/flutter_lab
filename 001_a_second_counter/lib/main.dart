import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Second Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo A Second Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _secondCounter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('STATE Counter: $_counter');
    });
  }

  void _incrementSecondCounter() {
    setState(() {
      _secondCounter++;
      print('STATE SecondCounter: $_secondCounter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Text(
                    '$_counter',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _incrementSecondCounter,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '$_secondCounter',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
