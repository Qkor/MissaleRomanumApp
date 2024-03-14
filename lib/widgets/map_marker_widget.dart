import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: Column(
              children: [
                Text(description, style: const TextStyle(fontSize: 16)),
                InkWell(
                    child: Text(link, style: const TextStyle(fontSize: 14, color: Colors.blue)),
                    onTap: () => launchUrl(Uri.parse(link))
                )
              ],
            ),
          );
        });
      },
    );
  }

}