import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  /* const MobileAppBar({super.key, required this.title});
  final String title; */

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: /* Text(title), */Image.asset('imagens/logopech.jpg',width: 60,),
              actions: [
                
                IconButton(onPressed: (){},
                 icon: const Icon(Icons.search)),
                 IconButton(onPressed: (){},
                 icon: const Icon(Icons.shopping_cart_rounded)),
                 IconButton(onPressed: (){},
                 icon: const Icon(Icons.more_vert)),

                ],
    );
  }
}