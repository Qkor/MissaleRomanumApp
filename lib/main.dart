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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              BlocProvider.of<NavBloc>(context).add(CalendarEvent(year: DateTime.now().year));
            }
            if(state is ProperLoadedState){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProperPage(proper: state.proper)),
              );
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
          child: BlocBuilder<NavBloc, NavState>(
            buildWhen: (previous, current) =>
              current is CalendarLoadedState ||
              current is OrdoLoadedState ||
              current is MapState ||
              current is LoadingState,
            builder: (context, state){
              if(state is CalendarLoadedState){
                return CalendarPage(calendar: state.calendar);
              } else if (state is OrdoLoadedState){
                return OrdoPage(ordo: state.ordo);
              } else if(state is MapState){
                return const MapPage();
              }
              return const LoadingPage();
            },
          ),
        ),
      )
    );
  }
}
