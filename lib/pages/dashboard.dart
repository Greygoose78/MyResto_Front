import 'package:flutter/material.dart';
import 'package:my_resto/pages/components/navigation_drawer_auth.dart';
import 'package:my_resto/pages/user/menu_card_auth.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resto'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: CustomDrawerAuth(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: SectionWithCards(),
            ),
          ),
        ], 
      ),
    );
  }
}