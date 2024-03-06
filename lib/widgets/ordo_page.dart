import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/ordo.dart';

class OrdoPage extends StatelessWidget{
  final Ordo ordo;
  const OrdoPage({super.key, required this.ordo});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordo.sections.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                  child: Text(ordo.sections[index].label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ),
              Text(ordo.sections[index].body[0][0])
            ],
          ),
        );
      }
    );
  }

}