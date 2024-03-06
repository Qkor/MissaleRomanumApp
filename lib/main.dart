import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_state.dart';
import 'package:missale/widgets/custom_app_bar.dart';
import 'package:missale/widgets/calendar_page.dart';
import 'package:missale/widgets/ordo_page.dart';

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
      home: BlocProvider<NavBloc>(
        create: (context) => NavBloc(),
        child: BlocListener<NavBloc, NavState>(
          listener: (context, state){},
          child: Scaffold(
            appBar: const CustomAppBar(),
            body: BlocBuilder<NavBloc, NavState>(
              builder: (context, state){
                if(state is CalendarLoadedState){
                  return CalendarPage(calendar: state.calendar);
                }
                if(state is OrdoLoadedState){
                  return const OrdoPage();
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      )
    );
  }
}
