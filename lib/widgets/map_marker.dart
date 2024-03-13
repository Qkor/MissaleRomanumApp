import 'package:flutter/material.dart';

class CustomMapMarker extends StatelessWidget{
  final String description;
  final String type;

  const CustomMapMarker({super.key, required this.description, required this.type});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.location_on, color: type=='fsspx' ? Colors.redAccent : Colors.blue),
      onTap: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text(description, style: const TextStyle(fontSize: 16),),
          );
        });
      },
    );
  }

}