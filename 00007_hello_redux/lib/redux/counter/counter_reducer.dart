import 'package:hello_redux/redux/counter/counter_actions.dart';
import 'package:hello_redux/redux/counter/counter_state.dart';

counterReducer(CounterState prevState, SetCounterStateAction action) {
  final payload = action.counterState;

  print("prev ${prevState.counter}");
  print("next ${payload.counter}");

  return prevState.copyWith(
    counter: payload.counter,
  );
}
