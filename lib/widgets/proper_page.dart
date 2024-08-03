import 'package:flutter/material.dart';
import 'package:missale/models/ordo.dart';
import 'package:missale/widgets/ordo_page_content.dart';

class ProperPage extends StatelessWidget{
  final Ordo proper;

  const ProperPage({super.key, required this.proper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          backgroundColor: Colors.grey[800],
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(proper.info.title)
      ),
      body: OrdoPageContent(ordo: proper),
    );
  }

}