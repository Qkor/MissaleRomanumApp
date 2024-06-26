import 'package:flutter/material.dart';
import 'package:missale/models/ordo.dart';
import 'package:missale/widgets/custom_app_bar.dart';
import 'package:missale/widgets/ordo_page_content.dart';

class OrdoPage extends StatelessWidget{
  final Ordo ordo;
  const OrdoPage({super.key, required this.ordo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Ordo Missae"),
      body: OrdoPageContent(ordo: ordo),
    );
  }

}