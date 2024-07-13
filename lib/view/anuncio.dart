import 'package:flutter/material.dart';
import 'package:pach_busca/Widget/item_produto.dart';
import 'package:pach_busca/Widget/mobile_app_bar.dart';
import 'package:pach_busca/Widget/web_app_bar.dart';
class Anuncios extends StatefulWidget {
  const Anuncios({super.key});

  @override
  State<Anuncios> createState() => _AnunciosState();
}
class _AnunciosState extends State<Anuncios> {
  ajustarVisualizacao(double largura){
int colunas = 2;
if(largura <= 600){
  colunas = 2;
}else if(largura <= 960){
colunas= 4;
}else{
  colunas = 6;
}
return colunas;
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        var largura = constraint.maxWidth;
        var alturaBarra = AppBar().preferredSize.height;


        return Scaffold(
            appBar: largura < 600 ? PreferredSize(
              preferredSize: Size(largura,alturaBarra),
               child: const MobileAppBar())//mobie----------------------------------------
                : PreferredSize(
              preferredSize: Size(largura,alturaBarra),
               child: const WebAppBar()),//web----------------------------------------
            body: Padding(
              padding: const EdgeInsets.all(6),
              child: GridView.count(
                crossAxisCount: ajustarVisualizacao(largura),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              children: [
               ItemProduto("Relógio","123,97","relogio.Jpg"),
                ItemProduto("Logo","0","smartphone.Jpg"),
                 ItemProduto("nNottr","23,97","relogio.Jpg"),
               
              ],),
            ));
      }
    );
  }
}
