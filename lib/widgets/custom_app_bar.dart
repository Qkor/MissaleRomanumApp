import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/bloc/nav_bloc.dart';
import 'package:missale/bloc/nav_event.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool appReady;
  const CustomAppBar({super.key, required this.title, required this.appReady});
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      leading: !appReady ? null : PopupMenuButton(
        icon: const Icon(Icons.menu),
        onSelected: (value){
          switch(value){
            case 'calendar':
              BlocProvider.of<NavBloc>(context).add(CalendarEvent(year: DateTime.now().year));
            case 'ordo':
              BlocProvider.of<NavBloc>(context).add(OrdoEvent());
            case 'map':
              BlocProvider.of<NavBloc>(context).add(MapEvent());
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
          const PopupMenuItem(
            value: 'map',
            child: Text('Mapa Mszy Św.'),
          ),
        ]
      ),
    );
  }

}