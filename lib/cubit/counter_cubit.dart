import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int value;
  CounterCubit(this.value) : super(CounterInitial(value: value));

  void incrementValue(){
    value++;
    print(value);
    emit(CounterIncrement(value));
  }

  void decrementValue(){
    value--;
        print(value);
    emit(CounterDecrement(value));
  }
}