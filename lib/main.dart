import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_state.dart';
import 'package:missale/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missale Romanum',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: BlocProvider<NavBloc>(
            create: (context) => NavBloc(),
            child: BlocListener<NavBloc, NavState>(
              listener: (context, state){},
              child: BlocBuilder<NavBloc, NavState>(
                builder: (context, state){
                  return switch(state){
                    _ => const Center(child: CircularProgressIndicator())
                  };
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
