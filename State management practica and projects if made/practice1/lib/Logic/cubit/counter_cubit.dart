import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter_value: 0,is_incremented: false));

  void increment() => emit(CounterState(counter_value: state.counter_value+1,is_incremented: true));
  void decrement() => emit(CounterState(counter_value: state.counter_value-1,is_incremented: false));
}
