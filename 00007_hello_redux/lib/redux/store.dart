import 'package:flutter/foundation.dart';
import 'package:hello_redux/redux/counter/counter_actions.dart';
import 'package:hello_redux/redux/counter/counter_reducer.dart';
import 'package:hello_redux/redux/counter/counter_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetCounterStateAction) {
    final nextCounterState = counterReducer(state.counterState, action);
    return state.copyWith(counterState: nextCounterState);
  }
  return state;
}

@immutable
class AppState {
  final CounterState counterState;

  AppState({@required this.counterState});

  AppState copyWith({
    CounterState counterState,
  }) {
    return AppState(
      counterState: counterState ?? this.counterState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    }
    return _store;
  }

  static Future<void> init() async {
    final counterStateInitial = CounterState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(counterState: counterStateInitial),
    );
  }
}