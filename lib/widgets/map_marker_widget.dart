import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
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
                    if(address.isNotEmpty) ... [
                      const Divider(),
                      Text(address, style: const TextStyle(fontSize: 14), textAlign: TextAlign.center),
                    ],
                    if(link.isNotEmpty) ... [
                      const Divider(),
                      Linkify(
                        onOpen: (url) => launchUrl(Uri.parse(url.url), mode: LaunchMode.externalApplication),
                        text: link,
                        linkStyle: const TextStyle(fontSize: 14, color: Colors.blue, decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      )
                    ]
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