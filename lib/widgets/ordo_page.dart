import 'package:flutter/material.dart';
import 'package:missale/models/ordo.dart';

class OrdoPage extends StatelessWidget{
  final Ordo ordo;
  const OrdoPage({super.key, required this.ordo});

  List<Widget> _getRubrics(List<List<String>> section, BuildContext context){
    return section.map((rubric){
      if(rubric.length == 1) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Text(rubric[0], style: const TextStyle(color: Colors.redAccent), textAlign: TextAlign.center),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2 - 20,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(rubric[0]),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/2 - 20,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(rubric[1]),
                ),
              ),
            ]
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordo.sections.length,
      itemBuilder: (BuildContext context, int index){
        List<Widget> rubrics = _getRubrics(ordo.sections[index].body, context);
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                  child: Text(ordo.sections[index].label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ),
              ...rubrics
            ],
          ),
        );
      }
    );
  }

}