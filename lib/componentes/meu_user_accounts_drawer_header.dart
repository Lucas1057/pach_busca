import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MeuUserAccountsDrawerHeader extends StatefulWidget {
  const MeuUserAccountsDrawerHeader({super.key});

  @override
  State<MeuUserAccountsDrawerHeader> createState() =>
      _MeuUserAccountsDrawerHeaderState();
}

class _MeuUserAccountsDrawerHeaderState
    extends State<MeuUserAccountsDrawerHeader> {
    String nomeUsuarioCadastrado = "Nome do usuario";
String emailUsuarioCadastrado = "Email do usuario";
  @override
  Widget build(BuildContext context) {
      FirebaseAuth auth = FirebaseAuth.instance;
    User? usuario = auth.currentUser;
    late String? nomeUsuario = usuario!.displayName;
     late String? emailUsuario = usuario!.email;
     bool usuarioLogado;
     if(usuario != null){
usuarioLogado = true;
     }else{
      usuarioLogado = false;
     }
     
    return  UserAccountsDrawerHeader(
      accountName: (usuarioLogado)? Text(nomeUsuario!) : const Text("Nome de Usuario"),
      accountEmail:  (usuarioLogado)? Text(emailUsuario!) : const Text("Email de Usuario"),
      currentAccountPicture:(usuarioLogado)? CircleAvatar(
        backgroundColor: Theme.of(context).platform == TargetPlatform.android
            ? const Color(0xff0062ac)
            : Colors.white,
        child: const Icon(
          Icons.person,
          size: 50,
        ),
      ): CircleAvatar(
        backgroundColor: Theme.of(context).platform == TargetPlatform.android
            ? const Color(0xff0062ac)
            : Colors.white,
        child: const Icon(
          Icons.no_accounts,
          size: 50,
        ),
      ),
    );
  }
}
