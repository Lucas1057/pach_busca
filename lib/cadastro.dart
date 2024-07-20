// ignore_for_file: use_build_context_synchronously



import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pach_busca/add_imagem.dart';
import 'package:pach_busca/meu_snackbar.dart';
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
  final storage = FirebaseStorage.instance;
  bool esconderSenha = true;
   visibilidadeSenha(){
    setState(() {
      esconderSenha = !esconderSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:ListView(
  padding: const EdgeInsets.all(12),
  children: [
TextFormField(
  controller: nomeControle,
  decoration: const InputDecoration(
    label: Text('Nome')
  ),
),
/* TextFormField(
  controller: sobrenomeControle,
  decoration: const InputDecoration(
    label: Text('Sobrenome')
  ),
), */
TextFormField(
  controller: emailControle,
  decoration: const InputDecoration(
    label: Text('Email')
  ),
),/* 
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
), */
TextFormField(
  controller: senhaControle,
  decoration:  InputDecoration(
    label: const Text('Senha'),
    suffixIcon: IconButton(
      onPressed: (){
      visibilidadeSenha();

      },icon: 
       Icon(esconderSenha == true ? Icons.visibility : Icons.visibility_off) ,)
  ),obscureText: esconderSenha,
)
,ElevatedButton(onPressed: (){cadastrar();}, child: const Text("Cadastrar")),
IconButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddImagem(),));
}, icon: Icon(Icons.photo_album_outlined))
  ],
)
    );
  }
Future<String?> cadastrar(/* String? nome,String? email,String? senha,String avatar */)async{
    try {
      UserCredential userCredential = await auth.
      createUserWithEmailAndPassword(email: emailControle.text, password: senhaControle.text);
      // ignore: unnecessary_null_comparison
      if(userCredential != null){
/* userCredential.user!.updateDisplayName(nomeControle.text);
final urlImagem = "${const Uuid().v4()}+${avatar.split(".").last}";
final ref =storage.ref(urlImagem);
await ref.putFile(avatar as File);
final fileUrl = await ref.getDownloadURL(); 

 userCredential.user?.updatePhotoURL(urlImagem);*/
Navigator.pushAndRemoveUntil(context,
MaterialPageRoute(builder: (context)=> const Anuncios(),),(route)=>false);
mostrarSnackbar(contexto: (context), texto: " Cadastrado com sucesso", isErro: false);
      }
    } on FirebaseAuthException  catch (e) {
      print(e.code);
      if(e.code == 'weak-password'){
        mostrarSnackbar(contexto: (context), texto: 'Cria uma senha mais forte.');
/* ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Cria uma senha mais forte.'))
); */
      }else if(e.code == 'email-already-in-use'){
        print('email ja existe');
/* ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('O email ja foi cadastrado.'))
); */
mostrarSnackbar(contexto: (context), texto: "O email ja foi cadastrado");
      }else{ mostrarSnackbar(contexto: (context), texto: "Ocorreu algum Erro!");}
     
    }
    return null;
  }
}