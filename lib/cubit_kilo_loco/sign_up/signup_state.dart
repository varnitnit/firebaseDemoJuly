import 'package:equatable/equatable.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  const SignupState({
    required this.password,
    required this.email,
    required this.status,
  });
  factory SignupState.initial() {
    return const SignupState(
        password: "", email: "", status: SignupStatus.initial);
  }

  SignupState copyWith(
      {String? email, String? password, SignupStatus? status}) {
    return SignupState(
        password: password ?? this.password,
        email: email ?? this.email,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,status];
}
