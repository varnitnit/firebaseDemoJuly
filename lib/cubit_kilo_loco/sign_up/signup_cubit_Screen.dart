import 'package:firebase_demo/cubit_kilo_loco/sign_up/signup_cubit.dart';
import 'package:firebase_demo/cubit_kilo_loco/sign_up/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit,SignupState>(
      builder: (context,state){
        return Column(
          children: [
            TextFormField(
              onChanged: (value){
                context.read<SignupCubit>().emailChanged(value);
              },
              decoration: const InputDecoration(
                hintText: "enter email"
              ),
            ),
            const SizedBox(height: 50,),
            TextFormField(
              onChanged: (value){
                context.read<SignupCubit>().passwordChanged(value);
              },
              decoration: const InputDecoration(
                hintText: "enter password"
              ),
            ),
          ],
        );
      },
    );
  }
}
