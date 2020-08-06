import 'package:meta/meta.dart';

@immutable
class CounterState {
  final int counter;

  CounterState({this.counter});

  factory CounterState.initial() => CounterState(counter: 0);

  CounterState copyWith({@required int counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
