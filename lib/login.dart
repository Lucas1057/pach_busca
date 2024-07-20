// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pach_busca/cadastro.dart';
import 'package:pach_busca/meu_snackbar.dart';


class Login extends StatefulWidget {
   Login({super.key});
  final auth = FirebaseAuth.instance;
deslogar(){return
  auth.signOut();
  
}
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailControle = TextEditingController(text: 'lucas@gmail.com');
  final senhaControle = TextEditingController(text: '1234567');
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  bool obSenha = true;
    bool queroEntrar = false;
visibilidadeSenha(){
  setState(() {
    obSenha = !obSenha;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:ListView(
  padding: const EdgeInsets.all(12),
  children: [
    Form(
      key: formKey,
      child: Column(
      children: [
      
      TextFormField(
      
      controller: emailControle,
      decoration: const InputDecoration(
        label: Text('Email'),
        
      ),
      validator: (String? valor){
        if(valor!.isEmpty){
          return "Campo Email vazio!";
        }
        if(valor.length < 5){
          return "Email muito curto";
        }if(!valor.contains("@")){
          return "o email não é Válido";
          }
      return null;
      },
      ), const SizedBox(height: 16,),
      TextFormField(
      controller: senhaControle,
      decoration:  InputDecoration(
        label: const Text('Senha'),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(64),
          borderSide: const BorderSide(
            color: Colors.red,width: 1
          )
        ),focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(64),
          borderSide: const BorderSide(
            color: Colors.blue,width: 2
          )),  
        
        focusedErrorBorder: 
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(64),
          borderSide: const BorderSide(
            color: Colors.red,width: 4
          ),
      ),
      suffixIcon: IconButton( 
      icon: Icon( obSenha  ? Icons.visibility : Icons.visibility_off),
      onPressed: () { visibilidadeSenha(); },)
      ),
      obscureText: obSenha,
               validator: (String? valor){
        if(valor!.isEmpty){
          return "Campo Senha vazio!";
        }
        if(valor.length < 5){
          return "Senha muito curta";
        }if(valor.length < 8){
          return "Senha Curta";
        }if(valor.contains(RegExp(r'[A-Z]'))){
          return "falta letras maior";
        }
      return null;
      }
      
      ),
      Visibility(visible: !queroEntrar,child: Column(children: [Text('mostrei conteudo')],), ), 
      SizedBox(height: 16,)
      ,ElevatedButton(onPressed: (){botaoPrincipalClicado();}, child: const Text("Entrar"),),
      Divider(),
      TextButton(onPressed: (){setState(() {
      queroEntrar = !queroEntrar;
      });}, child: Text('ainda não tem uma conta? Cadatre-se'),),
      
      ],
    )),
    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro(),));}, child: Text('Va para cadasro'))
  ],
)
    );
  }
Future<String?> login({required String email, required String senha})async{
    try {UserCredential userCredential=await
     auth.
      signInWithEmailAndPassword(email: emailControle.text, password: senhaControle.text); 
      userCredential.user!.email;  
/*Navigator.pushAndRemoveUntil(context,
 MaterialPageRoute(builder: (context)=> const Anuncios(),),(route)=>false);
mostrarSnackbar(contexto: (context), texto: " Cadastrado com sucesso", isErro: false); */
return null;
          } on FirebaseAuthException catch (e) {
            
       print(e.code);
      // print(e.message);
      if(e.code == 'invalid-credential'){
         mostrarSnackbar(contexto: (context), texto: 'Credencial invalida');
      }else if(e.code=="too-many-requests"){
         return 'muitas tentativas mal sucedidas';
      }
      else if(e.code == 'user-not-found'){
        mostrarSnackbar(contexto: (context), texto: 'O USUARIO NAO EXISTE.');
       }else if(e.code == 'second-factor-required'){
mostrarSnackbar(contexto: (context), texto: "O email ja foi cadastrado");
      }else{ mostrarSnackbar(contexto: (context), texto:  "Ocorreu algum Erro! \n o Erro foi (`${e.code}`)\n a mensagem do erro abaixo\n `${e.message}`");
print(e.code);
}
         }
    return null;
  }
  botaoPrincipalClicado(){
if(formKey.currentState!.validate()){

  /* print("form valido"); */
login(email: emailControle.text, senha: senhaControle.text).then((erro){
if(erro != null){
  mostrarSnackbar(contexto: (context), texto: erro);
}
});
}else{
  print("invalido");
}
  }
}