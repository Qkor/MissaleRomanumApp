import 'package:flutter/material.dart';
import 'package:missale/widgets/ordo_page.dart';
import 'package:missale/models/ordo.dart';

class ProperPage extends StatelessWidget{
  final Ordo proper;

  const ProperPage({super.key, required this.proper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(proper.info.title)),
      body: OrdoPage(ordo: proper),
    );
  }

}