import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_event.dart';
import 'package:missale/models/liturgical_calendar.dart';
import 'package:missale/widgets/custom_app_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarPage extends StatelessWidget{
  final List<LiturgicalCalendar> calendar;
  final scrollController = ItemScrollController();
  CalendarPage({super.key, required this.calendar});

  int getDayOfYear() {
    var now = DateTime.now();
    return now.difference(DateTime(now.year, 1, 1)).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: const CustomAppBar(title: "Propria"),
      body: ScrollablePositionedList.builder(
        initialScrollIndex: getDayOfYear(),
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
          return InkWell(
            onTap: (){
              BlocProvider.of<NavBloc>(context).add(ProperEvent(id: calendar[index].id));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(10,15,10,15),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: liturgicalColor, width: 5),
                  bottom: const BorderSide(color: Colors.grey, width: 1)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(calendar[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(calendar[index].id),
                ],
              ),
            ),
          );
        },
      )
    );
  }

}