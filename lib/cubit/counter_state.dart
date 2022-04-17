part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int value;
  CounterInitial({required this.value});
}

class CounterIncrement extends CounterState {
  final int value;
  CounterIncrement(this.value);
}

class CounterDecrement extends CounterState {
  final int value;
  CounterDecrement(this.value);
}