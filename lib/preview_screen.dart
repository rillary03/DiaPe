import 'dart:io';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final String imagePath;

  PreviewScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Imagem'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(File(imagePath)), // Exibe a imagem capturada
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Volta para a tela de captura
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text('Capturar Novamente'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Atualizado para usar backgroundColor
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implementar o envio da imagem ou outra ação
                    print('Imagem enviada!');
                  },
                  icon: Icon(Icons.send),
                  label: Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Atualizado para usar backgroundColor
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
