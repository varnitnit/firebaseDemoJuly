import 'package:firebase_demo/cubit_nitish/counter/counter_cubit/counter_state.dart';
import 'package:firebase_demo/cubit_nitish/settings/setting_cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/settings_views/setting_page.dart';
import '../counter_cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCounter extends StatelessWidget {
  const HomeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => SettingCubit()),
      ],
      child: BlocBuilder<SettingCubit, ThemeData>(
        builder: (context, state) {
          return const CounterScreen();
        },
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
              child: const Text("settings")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  'Count: ${state.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
