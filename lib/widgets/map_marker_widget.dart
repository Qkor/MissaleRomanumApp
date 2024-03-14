import 'package:flutter/material.dart';

class CustomMapMarkerWidget extends StatelessWidget{
  final String description;
  final String link;
  final String type;

  const CustomMapMarkerWidget({super.key, required this.description, required this.type, required this.link});

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