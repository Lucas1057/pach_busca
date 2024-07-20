import 'package:flutter/material.dart';
import 'package:pach_busca/componentes/menus.dart';

class Produto extends StatefulWidget {
  const Produto({super.key});

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      drawer:  Menus(),
      body: Container(),);
  }
}