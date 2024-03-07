import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_event.dart';
import 'package:missale/bloc/nav_state.dart';
import 'package:missale/widgets/custom_app_bar.dart';
import 'package:missale/widgets/calendar_page.dart';
import 'package:missale/widgets/ordo_page.dart';
import 'package:missale/widgets/proper_page.dart';

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
        create: (context) => NavBloc()..add(NavCalendarEvent()),
        child: BlocListener<NavBloc, NavState>(
          listener: (context, state){
            if(state is ProperLoadedState){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProperPage(proper: state.proper)),
              );
            }
          },
          child: Scaffold(
            appBar: const CustomAppBar(),
            body: BlocBuilder<NavBloc, NavState>(
              builder: (context, state){
                if(state is LoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                if(state is CalendarLoadedState){
                  return CalendarPage(calendar: state.calendar);
                }
                if(state is OrdoLoadedState){
                  return OrdoPage(ordo: state.ordo);
                }
                return const Center();
              },
            ),
          ),
        ),
      )
    );
  }
}
