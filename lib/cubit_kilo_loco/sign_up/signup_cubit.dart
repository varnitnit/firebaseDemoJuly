import 'package:bloc/bloc.dart';
import 'package:firebase_demo/cubit_kilo_loco/sign_up/signup_state.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit():super(SignupState.initial());

  void emailChanged(String value){
    emit(state.copyWith(email: value,status: SignupStatus.initial));
  }

  void passwordChanged(String value){
    emit(state.copyWith(password: value,status: SignupStatus.initial));
  }

}