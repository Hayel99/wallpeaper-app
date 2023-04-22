import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  List<dynamic> _searchResults = [];

  Future<void> _performSearch() async {
    final url = Uri.parse(
        'https://api.pexels.com/v1/search?query=$_searchQuery&per_page=10');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'b3WwMrMkCQsgW9JBZ5NENB65tJqxAECGtXTqICybIjTUm7FiTo3PkmhC'
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _searchResults = data['photos'];
      });
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for photos...',
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          onSubmitted: (value) {
            _performSearch();
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 300,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: _searchResults.length,
          itemBuilder: (BuildContext context, index) {
            final photo = _searchResults[index];
            return InkWell(
              onTap: () {},
              child: Card(
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.grey,
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(
                          photo['src']['medium'],
                        ),
                      ),
                      width: 178,
                      height: 240,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Tacken by ${photo['photographer']}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
//  