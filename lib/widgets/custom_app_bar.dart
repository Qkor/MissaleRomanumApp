import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/nav_bloc.dart';
import '../bloc/nav_event.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Missale Romanum"),
      leading: PopupMenuButton(
        icon: const Icon(Icons.menu),
        onSelected: (value){
          switch(value){
            case 'calendar':
              BlocProvider.of<NavBloc>(context).add(NavCalendarEvent());
            case 'ordo':
              BlocProvider.of<NavBloc>(context).add(NavOrdoEvent());
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'calendar',
            child: Text('Calendar'),
          ),
          const PopupMenuItem(
            value: 'ordo',
            child: Text('Ordo'),
          ),
        ]
      ),
    );
  }

}