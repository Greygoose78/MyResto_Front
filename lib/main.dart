import 'package:flutter/material.dart';
import 'package:my_resto/pages/home_page.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyResto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: HomePage(),
    );
  }
}
