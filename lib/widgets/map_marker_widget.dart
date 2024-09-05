import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMapMarkerWidget extends StatelessWidget{
  final String name;
  final String address;
  final String link;

  const CustomMapMarkerWidget({super.key, required this.name, required this.address, required this.link});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: GestureDetector(
          child: const Icon(Icons.location_on, color: Colors.blue, size: 30),
          onTap: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Column(
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    const Divider(),
                    Text(address, style: const TextStyle(fontSize: 14), textAlign: TextAlign.center),
                    const Divider(),
                    InkWell(
                      child: Text(link, style: const TextStyle(fontSize: 14, color: Colors.blue), textAlign: TextAlign.center),
                      onTap: () => launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication)
                    )
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }

}