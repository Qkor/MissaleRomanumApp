import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_event.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/widgets/custom_app_bar.dart';

class CalendarPage extends StatelessWidget{
  final List<LiturgicalCalendar> calendar;
  const CalendarPage({super.key, required this.calendar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Propria"),
      body: ListView.builder(
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
            minVerticalPadding: 0,
            title: GestureDetector(
              onTap: (){
                BlocProvider.of<NavBloc>(context).add(ProperEvent(id: calendar[index].id));
              },
              child: Card(
                margin: EdgeInsets.zero,
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
      )
    );
  }

}