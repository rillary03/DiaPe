import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Configurações'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Ação para voltar à tela anterior
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
            title: Text('Editar Perfil'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Ação para editar o perfil
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Theme.of(context).primaryColor),
            title: Text('Alterar Senha'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Ação para alterar a senha
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
            title: Text('Notificações'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Ação para configurar notificações
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.palette, color: Theme.of(context).primaryColor),
            title: Text('Tema'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Ação para alterar o tema
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_outline, color: Theme.of(context).primaryColor),
            title: Text('Ajuda e Suporte'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Ação para acessar ajuda e suporte
            },
          ),
        ],
      ),
    );
  }
}
