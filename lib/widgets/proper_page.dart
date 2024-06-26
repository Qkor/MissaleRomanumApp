import 'package:flutter/material.dart';
import 'package:missale/models/ordo.dart';
import 'package:missale/widgets/ordo_page_content.dart';

class ProperPage extends StatelessWidget{
  final Ordo proper;

  const ProperPage({super.key, required this.proper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(proper.info.title), centerTitle: true),
      body: OrdoPageContent(ordo: proper),
    );
  }

}