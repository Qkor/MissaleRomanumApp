import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget{

  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text('Missale Romanum'),
      ),
      body: const Center(
          child: CircularProgressIndicator()
      ),
    );
  }
}