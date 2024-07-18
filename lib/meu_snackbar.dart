import "package:flutter/material.dart";


mostrarSnackbar({
  required BuildContext contexto, required String texto, bool isErro =true
}){
SnackBar snackBar = SnackBar(
  content: Text(texto),
  backgroundColor: (isErro) ? Colors.red: Colors.green,
  duration: const Duration(seconds: 4),
showCloseIcon: true,

  );

  ScaffoldMessenger.of(contexto).showSnackBar(snackBar);
}