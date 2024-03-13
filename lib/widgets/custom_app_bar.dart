import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/nav_bloc.dart';
import '../bloc/nav_event.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBar({super.key, required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: PopupMenuButton(
        icon: const Icon(Icons.menu),
        onSelected: (value){
          switch(value){
            case 'calendar':
              BlocProvider.of<NavBloc>(context).add(NavCalendarEvent(year: DateTime.now().year));
            case 'ordo':
              BlocProvider.of<NavBloc>(context).add(NavOrdoEvent());
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'calendar',
            child: Text('Propria'),
          ),
          const PopupMenuItem(
            value: 'ordo',
            child: Text('Ordo Missae'),
          ),
        ]
      ),
    );
  }

}