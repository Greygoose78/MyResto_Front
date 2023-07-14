import 'package:flutter/material.dart';
import 'package:my_resto/pages/auth/login.dart';
import 'package:my_resto/pages/home_page.dart';

class CustomDrawer extends StatelessWidget {
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
              'My Resto',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Connexion'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          // Add more ListTiles for additional drawer items
        ],
      ),
    );
  }
}