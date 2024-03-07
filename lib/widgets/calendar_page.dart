import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/nav_bloc.dart';
import '../bloc/nav_event.dart';
import '../models/calendar.dart';

class CalendarPage extends StatelessWidget{
  final List<LiturgicalCalendar> calendar;
  const CalendarPage({super.key, required this.calendar});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calendar.length,
      itemBuilder: (BuildContext context, int index){
        Color liturgicalColor = switch(calendar[index].colors[0]){
          'w' => Colors.white,
          'v' => Colors.purple,
          'p' => Colors.pinkAccent,
          'r' => Colors.red,
          'b' => Colors.black,
          _ => Colors.green
        };
        return ListTile(
          title: GestureDetector(
            onTap: (){
              BlocProvider.of<NavBloc>(context).add(NavProperEvent(id: calendar[index].id));
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border(left: BorderSide(color: liturgicalColor, width: 5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(calendar[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(calendar[index].id),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}