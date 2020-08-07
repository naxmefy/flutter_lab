import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sqflite/sqflite.dart';

// enum Actions { Increment }
// we change to class to pass attributes via properties
class UpdateCounterAction {
  int count;
  UpdateCounterAction(this.count);
}

int counterReducer(int prevState, dynamic action) {
  // if (action == Actions.Increment) {
  if (action is UpdateCounterAction) {
    return action.count;
  }

  return prevState;
}

Function readCounter = (Store<int> store) async {
  CounterDAO counterDAO = await DatabaseUtil().counterDAO;
  store.dispatch(UpdateCounterAction(await counterDAO.read()));
};

Function incrementCounter = (Store<int> store) async {
  print("updateCounter");
  CounterDAO counterDAO = await DatabaseUtil().counterDAO;
  int current = await counterDAO.read();
  current = current + 1;
  await counterDAO.update(current);
  store.dispatch(UpdateCounterAction(current));
};

Function decrementCounter = (Store<int> store) async {
  print("updateCounter");
  CounterDAO counterDAO = await DatabaseUtil().counterDAO;
  int current = await counterDAO.read();
  current = current - 1;
  await counterDAO.update(current);
  store.dispatch(UpdateCounterAction(current));
};

Function resetCounter = (Store<int> store) async {
  CounterDAO counterDAO = await DatabaseUtil().counterDAO;
  await counterDAO.reset();
  store.dispatch(UpdateCounterAction(await counterDAO.read()));
};

void main() async {
  final store = new Store<int>(
    counterReducer,
    middleware: [thunkMiddleware],
    initialState: 0,
  );

  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.dark(),
        title: title,
        home: StoreBuilder<int>(
          onInit: (store) => store.dispatch(readCounter),
          builder: (context, count) => new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    'You have pushed the button this many times:',
                  ),
                  new StoreConnector<int, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) {
                      return new Text(
                        count,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  )
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(incrementCounter);
                  },
                  builder: (context, callback) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new FloatingActionButton(
                        onPressed: callback,
                        tooltip: 'Increment',
                        child: new Icon(Icons.add),
                      ),
                    );
                  },
                ),
                new StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(decrementCounter);
                  },
                  builder: (context, callback) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new FloatingActionButton(
                        onPressed: callback,
                        tooltip: 'Decrement',
                        child: new Icon(Icons.remove),
                      ),
                    );
                  },
                ),
                new StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(resetCounter);
                  },
                  builder: (context, callback) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new FloatingActionButton(
                        onPressed: callback,
                        tooltip: 'Reset',
                        child: new Icon(Icons.delete),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterDAO {
  static const String TABLE_NAME = 'COUNTER';
  static const String COLUMN = 'VALUE';

  Database _database;

  CounterDAO(this._database);

  static void migrate(Database database) async {
    // SharedPreferences would be better "in this case"
    // just for demo...
    await database.execute(
      'CREATE TABLE $TABLE_NAME('
      '$COLUMN INTEGER'
      ')',
    );
    await database.insert(
      TABLE_NAME,
      {COLUMN: 0},
    );
  }

  Future<int> reset() async {
    return await update(0);
  }

  Future<int> update(int count) async {
    return await _database.update(
      TABLE_NAME,
      {COLUMN: count},
    );
  }

  Future<int> read() async {
    var record = await _database.rawQuery('SELECT $COLUMN FROM $TABLE_NAME');
    if (record.length == 0) {
      await reset();
      return read();
    }

    return record.first.values.first;
  }
}

class DatabaseUtil {
  static final DatabaseUtil _instance = new DatabaseUtil._internal();

  factory DatabaseUtil() => _instance;

  DatabaseUtil._internal();

  Database _databaseInstance;

  Future<Database> _init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: _onOpen,
      onCreate: _onCreate,
    );
  }

  Future<Database> get _database async {
    if (_databaseInstance == null) {
      _databaseInstance = await _init();
    }
    return _databaseInstance;
  }

  Future<void> _onOpen(Database db) async {
    // Database is open, print its version
    print('db version ${await db.getVersion()}');
  }

  void _onCreate(Database db, int newVersion) {
    // run migrations here
    CounterDAO.migrate(db);
  }

  void close() async {
    Database instance = await _database;
    instance.close();
  }

// example
// Future<MyDao> get myDao async => MyDao(await _database);
  Future<CounterDAO> get counterDAO async => CounterDAO(await _database);
}
