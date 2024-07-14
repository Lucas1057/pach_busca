// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pach_busca/view/anuncio.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nomeControle = TextEditingController();
  final emailControle = TextEditingController();
  final senhaControle = TextEditingController();
  final sobrenomeControle = TextEditingController();
  final celularControle = TextEditingController();
  final estadoControle = TextEditingController();
  final cidadeControle = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
body:ListView(
  padding: const EdgeInsets.all(12),
  children: [
TextFormField(
  controller: nomeControle,
  decoration: const InputDecoration(
    label: Text('Nome')
  ),
),
TextFormField(
  controller: sobrenomeControle,
  decoration: const InputDecoration(
    label: Text('Sobrenome')
  ),
),
TextFormField(
  controller: emailControle,
  decoration: const InputDecoration(
    label: Text('Email')
  ),
),
TextFormField(
  controller: celularControle,
  decoration: const InputDecoration(
    label: Text('Celular')
  ),
),
TextFormField(
  controller: cidadeControle,
  decoration: const InputDecoration(
    label: Text('Cidade')
  ),
),
TextFormField(
  controller: estadoControle,
  decoration: const InputDecoration(
    label: Text('Estado')
  ),
),
TextFormField(
  controller: senhaControle,
  decoration: const InputDecoration(
    label: Text('Senha')
  ),
)
,ElevatedButton(onPressed: (){cadastrar();}, child: const Text("Cadastrar"))
  ],
)
    );
  }
  cadastrar()async{
    try {
      UserCredential userCredential = await auth.
      createUserWithEmailAndPassword(email: emailControle.text, password: senhaControle.text);
      // ignore: unnecessary_null_comparison
      if(userCredential != null){
userCredential.user!.updateDisplayName(nomeControle.text);
Navigator.pushAndRemoveUntil(context,
MaterialPageRoute(builder: (context)=> const Anuncios(),),(route)=>false);
      }
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Cria uma senha mais forte.'))
);
      }else if(e.code == 'email-already-in-user'){
        print('email ja existe');
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('O email ja foi cadastrado.'))
);
      }
    }
  }
}