import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemProduto extends StatelessWidget {
  String? descricao;
   String? preco;
 String? imagem;

  ItemProduto(String descricao, String preco, String imagem, {super.key});

 
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white
      ),
padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      Expanded(flex: 8,
        child: Image.asset('imagens/$imagem',fit: BoxFit.contain,width: 50,),),
        Expanded(flex: 1,
        child: Text(descricao!),),
        Expanded(flex: 1,
        child: Text('R\$ $preco'),)
    ],
  ),  ) ;
  }
}