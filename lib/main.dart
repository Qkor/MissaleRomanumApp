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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget homePageBody = const Center();
  String homePageTitle = "Missale Romanum";


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
            if(state is LoadingState){
              setState(() {
                homePageBody = const Center(child: CircularProgressIndicator());
              });
            }
            if(state is CalendarLoadedState){
              setState(() {
                homePageBody = CalendarPage(calendar: state.calendar);
                homePageTitle = "Propria";
              });
            }
            if(state is OrdoLoadedState){
              setState(() {
                homePageBody = OrdoPage(ordo: state.ordo);
                homePageTitle = "Ordo Missae";
              });
            }
          },
          child: Scaffold(
            appBar: CustomAppBar(title: homePageTitle),
            body: homePageBody
          ),
        ),
      )
    );
  }
}
