import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImagem extends StatefulWidget {
  const AddImagem({super.key});
  @override
  State<AddImagem> createState() => _AddImagemState();
}

class _AddImagemState extends State<AddImagem> {
File? pickImage;
Uint8List webImage = Uint8List(8);

  @override
  Widget build(BuildContext context) {
    Future<void>pickerImage()async{
if(!kIsWeb){
final ImagePicker picker = ImagePicker();
XFile? image = await picker.pickImage(source: ImageSource.gallery);
if(image != null){
  var selected = File(image.path);
  setState((){
    pickImage = selected;
  });
}else{
  const SnackBar(content: AlertDialog(title: Text('Nao tem imagem'),) );
}
}else if(kIsWeb){
  final ImagePicker picker = ImagePicker();
XFile? image = await picker.pickImage(source: ImageSource.gallery);
if(image != null){
 var f = await image.readAsBytes();
 setState(() {
   webImage = f;
   pickImage = File('a');
 });
}else{
  const SnackBar(content: AlertDialog(title: Text('Nao tem imagem'),) );
}
}
}
    return  Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: (){pickerImage();}, child: Text('add image')),
          Card(child: pickImage == null ? Text('Sem imagem'): kIsWeb? Image.memory(webImage,fit: BoxFit.fill,):
          Image.file(pickImage!,fit: BoxFit.fill,))
        ],
      ),
    );
  }
}