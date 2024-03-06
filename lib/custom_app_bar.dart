import 'package:flutter/material.dart';

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
          print(value);
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 0,
            child: Text("Propria"),
          ),
          const PopupMenuItem(
            value: 1,
            child: Text("Ordo"),
          ),
        ]
      ),
    );
  }

}