import 'package:flutter/material.dart';
import 'package:my_resto/pages/components/navigation_drawer_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class CommandsPage extends StatefulWidget {
  @override
  State<CommandsPage> createState() => _CommandsPageState();
}

class _CommandsPageState extends State<CommandsPage> {
  List<Map<String, dynamic>> foodList = [];
  Future<void> fetchCardData() async {
    const baseUrl = 'http://holgar.duckdns.org/api/card';
    final url = Uri.parse(baseUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        foodList = [
          ...List<Map<String, dynamic>>.from(data['entry']),
          ...List<Map<String, dynamic>>.from(data['main']),
          ...List<Map<String, dynamic>>.from(data['dessert']),
          ...List<Map<String, dynamic>>.from(data['drink']),
        ];
      });
    } else {
      print('Erreur lors de la récupération des données : ${response.statusCode}');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchCardData();
  }

  @override
  Widget build(BuildContext context) {

    Uint8List arrayBufferToBase64(List<int> arrayBuffer) {
        var bytes = Uint8List.fromList(arrayBuffer);
        var base64 = base64Encode(bytes);
        Uint8List image = base64Decode(base64);
        return image;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resto'),
      ),
      drawer: CustomDrawerAuth(),
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text('Mes commandes', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white,
                        ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text('Commande 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white,
                        ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text('Commande 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Colors.white,
                        ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text('Commande 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ), 
      ),
    );
  }
}
