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
  final int year;
  final bool scrollToToday;
  CalendarPage({super.key, required this.calendar, required this.year, this.scrollToToday=false});

  int getDayOfYear() {
    var now = DateTime.now();
    return now.difference(DateTime(now.year, 1, 1)).inDays;
  }

  @override
  Widget build(BuildContext context) {
    final today = getDayOfYear();
    final currentYear = year==DateTime.now().year;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: const CustomAppBar(title: "Propria"),
      body: ScrollablePositionedList.builder(
        initialScrollIndex: scrollToToday ? today : 0,
        itemCount: calendar.length + 2,
        itemBuilder: (BuildContext context, int index){
          if(index == 0){
            return InkWell(
              onTap: (){
                BlocProvider.of<NavBloc>(context).add(CalendarEvent(year: year - 1));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10,15,10,15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1)
                  )
                ),
                child: Row(
                  children: [
                    const Icon(Icons.chevron_left),
                    Text("${year - 1}")
                  ],
                ),
              ),
            );
          }
          if(index == calendar.length+1){
            return InkWell(
              onTap: (){
                BlocProvider.of<NavBloc>(context).add(CalendarEvent(year: year + 1));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10,15,10,15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("${year + 1}"),
                    const Icon(Icons.chevron_right)
                  ],
                ),
              ),
            );
          }
          final day=index-1;
          Color liturgicalColor = switch(calendar[day].colors[0]){
            'w' => Colors.white,
            'v' => Colors.purple,
            'p' => Colors.pinkAccent,
            'r' => Colors.red,
            'b' => Colors.black,
            _ => Colors.green
          };
          return InkWell(
            onTap: (){
              BlocProvider.of<NavBloc>(context).add(ProperEvent(id: calendar[day].id));
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(10,15,10,15),
              decoration: BoxDecoration(
                  color: currentYear && day==today ? Colors.grey[850] : null,
                  border: Border(
                  left: BorderSide(color: liturgicalColor, width: 5),
                  bottom: const BorderSide(color: Colors.grey, width: 1)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(calendar[day].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(calendar[day].id),
                ],
              ),
            ),
          );
        },
      )
    );
  }

}