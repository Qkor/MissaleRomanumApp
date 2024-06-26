import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_event.dart';
import 'package:missale/bloc/nav_state.dart';
import 'package:missale/widgets/calendar_page.dart';
import 'package:missale/widgets/loading_page.dart';
import 'package:missale/widgets/map_page.dart';
import 'package:missale/widgets/ordo_page.dart';
import 'package:missale/widgets/proper_page.dart';
import 'models/map_marker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool appReady = false;
  Widget homePageBody = const LoadingPage();
  List<MapMarker> mapMarkers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missale Romanum',
      theme: ThemeData.dark(),
      home: BlocProvider<NavBloc>(
        create: (context) => NavBloc()..add(StartupEvent()),
        child: BlocListener<NavBloc, NavState>(
          listener: (context, state){
            if(state is AppReadyState){
              setState(() {
                mapMarkers = state.mapMarkers;
                appReady = true;
              });
              BlocProvider.of<NavBloc>(context).add(CalendarEvent(year: DateTime.now().year));
            }
            if(state is ProperLoadedState){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProperPage(proper: state.proper)),
              );
            }
            if(state is LoadingState){
              setState(() {
                homePageBody = const LoadingPage();
              });
            }
            if(state is CalendarLoadedState){
              setState(() {
                homePageBody = CalendarPage(calendar: state.calendar);
              });
            }
            if(state is OrdoLoadedState){
              setState(() {
                homePageBody = OrdoPage(ordo: state.ordo);
              });
            }
            if(state is MapState){
              setState(() {
                homePageBody = MapPage(markers: mapMarkers);
              });
            }
            if(state is FailureState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Nie udało się pobrać rubryk, sprawdź połączenie z internetem',
                    style: TextStyle(color: Colors.white)
                  ),
                  backgroundColor: Colors.red[900],
                ),
              );
            }
          },
          child: homePageBody,
        ),
      )
    );
  }
}
