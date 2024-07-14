import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pach_busca/cadastro.dart';
import 'package:pach_busca/view/anuncio.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: const FirebaseOptions(
     apiKey: "AIzaSyDA6zpVY2-vBPkMa81g5gEMX0LYPzU59CY",
      authDomain: "pech-busca.firebaseapp.com",
      projectId: "pech-busca",
      storageBucket: "pech-busca.appspot.com",
      messagingSenderId: "1072421181055",
      appId: "1:1072421181055:web:452a29bf01210ee41c114a",
      measurementId: "G-HL2T1NM52Z")
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pach busca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const Anuncios(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/anuncios': (context) => const Anuncios(),
        '/cadastro': (context) => const Cadastro(),
      } ,
    );
  }
}

