import 'dart:convert';
import 'package:hello_redux/redux/store.dart';
import 'package:meta/meta.dart';
import 'package:hello_redux/redux/counter/counter_state.dart';
import 'package:redux/redux.dart';

@immutable
class SetCounterStateAction {
  final CounterState counterState;

  SetCounterStateAction(this.counterState);
}

Future<void> incrementCounterAction(Store<AppState> store) async {
  store.dispatch(
    SetCounterStateAction(
      CounterState(counter: store.state.counterState.counter + 1),
    ),
  );
}

Future<void> decrementCounterAction(Store<AppState> store) async {
  store.dispatch(
    SetCounterStateAction(
      CounterState(counter: store.state.counterState.counter - 1),
    ),
  );
}
