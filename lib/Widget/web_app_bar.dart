import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Row( 
        children: [
          Image.asset('imagens/logopech.jpg',fit: BoxFit.contain,width: 50,),
          Expanded(child: Container()),
           IconButton(onPressed: (){},
                 icon: const Icon(Icons.search)),
                 IconButton(onPressed: (){},
                 icon: const Icon(Icons.shopping_cart_rounded)),
                 OutlinedButton(
                  onPressed: (){Navigator.pushReplacementNamed(context, '/cadastro');},
                   style: OutlinedButton.styleFrom(backgroundColor: Colors.lightBlueAccent,
                   ),
                   child: const Text('Cadastrar'),
                   ),const SizedBox(width: 10,),
                   OutlinedButton(
                  onPressed: (){},
                   style: OutlinedButton.styleFrom(backgroundColor: Colors.orange,
                   ),
                   child: const Text('Entrar'),
                   )
        ],
      ),
    );
  }
}