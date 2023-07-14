import 'package:flutter/material.dart';
import 'package:my_resto/pages/auth/login.dart';
import 'package:my_resto/pages/dashboard.dart';
import 'package:my_resto/pages/user/commands.dart';

class CustomDrawerAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Text(
              'Bienvenue sur votre compte MyResto !',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Tableau de bord'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.local_shipping_outlined),
            title: Text('Mes commandes'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommandsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}