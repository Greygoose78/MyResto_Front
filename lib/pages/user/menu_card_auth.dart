import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class SectionWithCards extends StatefulWidget {
  
  @override
  State<SectionWithCards> createState() => _SectionWithCardsState();
}

class _SectionWithCardsState extends State<SectionWithCards> {
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
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            ),
            Expanded(
              flex: 6,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children:
                  foodList.map((product) {
                    final Uint8List imageData = arrayBufferToBase64(List<int>.from(product['image']));
                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(imageData),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                          border: Border.all(
                            width: 6,
                            color: Colors.black,
                            ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${product['name']?.toString() ?? ''} - ${product['price']?.toString() ?? ''}€',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'utf8',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_card_outlined,
                                size: 24.0,
                              ),
                              label: Text('ajouter'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },).toList()
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}