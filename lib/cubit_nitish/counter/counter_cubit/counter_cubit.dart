import 'package:firebase_demo/cubit_nitish/counter/counter_cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);

  void increment(){
    final updateValue=state+1;
    emit(updateValue);
  }
  void decrement(){
    final updateValue=state-1;
    emit(updateValue);
  }
}*/

class CounterCubit extends Cubit<CounterState>{
  CounterCubit():super(CounterState());

  void increment(){
    final count=state.count+1;
    final updateState=CounterState(count: count);
    emit(updateState);
  }
  void decrement(){
    final count=state.count-1;
    final updateState=CounterState(count: count);
    emit(updateState);
  }
}