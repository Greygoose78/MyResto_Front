import 'package:flutter/material.dart';
import 'package:my_resto/pages/components/navigation_drawer.dart';
import 'package:my_resto/pages/components/menu_card_visit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resto'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: CustomDrawer(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: HomeSectionWithCards(),
            ),
          ),
        ], 
      ),
    );
  }
}