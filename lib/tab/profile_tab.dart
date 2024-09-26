import 'package:flutter/material.dart';
import 'package:diape/settings_screen.dart'; // Importe a tela de configurações

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho e seção do perfil
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Cor rosa da paleta do tema
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 10, // Espaço abaixo do entalhe
              bottom: 20,
            ),
            child: Column(
              children: [
                // Cabeçalho com botão de voltar e configurações
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Ação para voltar à tela anterior
                      },
                    ),
                    const Text(
                      'Perfil',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsScreen()),
                        ); // Navega para a tela de configurações
                      },
                    ),
                  ],
                ),
                // Foto de perfil e informações do usuário
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Centraliza o conteúdo
                    children: [
                      // Foto de perfil com ícone de edição
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/profile_image.png'), // Substitua pelo caminho correto da imagem
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.camera_alt,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Nome do usuário
                      Text(
                        'Usuário Nome',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Descrição do usuário
                      Text(
                        'Estudante de Computação',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Parte branca que preenche o restante da tela
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
