import 'package:flutter/material.dart';
import 'tab/home_tab.dart';
import 'tab/chat_tab.dart';
import 'tab/history_tab.dart';
import 'tab/profile_tab.dart';
import 'camera_screen.dart'; // Importe a tela de câmera

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de telas correspondentes aos ícones
  final List<Widget> _screens = [
    HomeTab(),
    ChatTab(),
    Container(), // Placeholder para a câmera; o botão de câmera usará outra abordagem
    HistoryTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      extendBody: true, // Adiciona esta linha para estender o corpo abaixo da barra de navegação
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none, // Permite que os widgets transbordem sem corte
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 28, // Aumentando o tamanho dos ícones
                  icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.pink : Colors.grey),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  iconSize: 28,
                  icon: Icon(Icons.chat, color: _selectedIndex == 1 ? Colors.pink : Colors.grey),
                  onPressed: () => _onItemTapped(1),
                ),
                SizedBox(width: 60), // Espaço para o ícone da câmera
                IconButton(
                  iconSize: 28,
                  icon: Icon(Icons.history, color: _selectedIndex == 3 ? Colors.pink : Colors.grey),
                  onPressed: () => _onItemTapped(3),
                ),
                IconButton(
                  iconSize: 28,
                  icon: Icon(Icons.person, color: _selectedIndex == 4 ? Colors.pink : Colors.grey),
                  onPressed: () => _onItemTapped(4),
                ),
              ],
            ),
          ),
          // Destaque do ícone da câmera
          Positioned(
            top: -20, // Ajuste para fazer o ícone da câmera sair do retângulo
            child: GestureDetector(
              onTap: () {
                // Navega para a tela da câmera quando o botão é pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
