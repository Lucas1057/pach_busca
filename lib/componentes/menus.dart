import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pach_busca/cadastro.dart';
import 'package:pach_busca/componentes/meu_user_accounts_drawer_header.dart';


class Menus extends StatefulWidget {
    Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  MeuUserAccountsDrawerHeader? meuUserAccountsDrawerHeader = const MeuUserAccountsDrawerHeader();
   FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
   User? usuario = auth.currentUser;
   bool usuarioLogado;
     if(usuario != null){
usuarioLogado = true;
     }else{
      usuarioLogado = false;
     }
         return Drawer(elevation:1.5,
      child: ListView(
        children: [
          const MeuUserAccountsDrawerHeader(),
          const ListTile(title:Text('alguma coisa') ,),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            child:(usuarioLogado)?  const Text("V1.0.0",style: TextStyle(fontWeight: FontWeight.bold),):TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => const Cadastro(),));}, child: const Text('Cadastre-se',style: TextStyle(fontWeight: FontWeight.bold)
            )
            )
          ),
          TextButton(onPressed: (){Navigator.pushReplacementNamed(context, '/login');}, child: Text('Login'))
        ],
      )
    );
  }
}