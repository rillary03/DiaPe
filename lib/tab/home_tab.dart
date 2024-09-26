import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho com logo, texto centralizado e ícone de notificações
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Cor rosa da paleta do tema

            ),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 10, // Espaço abaixo do entalhe
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo.png', // Substitua pelo caminho correto do logo
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Diapé',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  iconSize: 28, // Aumenta levemente o ícone de notificações
                  icon: const Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: () {
                    // Ação do ícone de notificações (pode adicionar uma função futuramente)
                  },
                ),
              ],
            ),
          ),
          // Texto "Bem vindo(a), Usuário" centralizado no cabeçalho
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  'Bem vindo(a), Usuário',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Parte branca que se adapta ao tamanho da tela
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
