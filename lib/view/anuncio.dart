import 'package:flutter/material.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({super.key, required this.title});


  final String title;

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:Container()
    );
  }
}
