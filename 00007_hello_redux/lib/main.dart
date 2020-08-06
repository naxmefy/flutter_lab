import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hello_redux/redux/counter/counter_actions.dart';
import 'package:hello_redux/redux/store.dart';

void main() async {
  await Redux.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _onPressed() {
    print("rofl");
    Redux.store.dispatch(incrementCounterAction);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: StoreConnector<AppState, int>(
          distinct: true,
          converter: (store) => store.state.counterState.counter,
          builder: (context, counter) => Scaffold(
            appBar: AppBar(
              title: Text("Hello Redux"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () => Redux.store.dispatch(incrementCounterAction),
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () => Redux.store.dispatch(decrementCounterAction),
                    tooltip: 'Increment',
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
