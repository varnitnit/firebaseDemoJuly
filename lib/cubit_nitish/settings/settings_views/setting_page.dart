import 'package:firebase_demo/cubit_nitish/settings/setting_cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings"
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            final cubit=context.read<SettingCubit>();
            cubit.toggleTheme();
          },
          child: const Text("Toggle Theme"),
        ),
      ),
    );
  }
}
