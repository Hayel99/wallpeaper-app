import 'package:flutter/material.dart';

import '../myphotos.dart';
import '../providers/getphotos.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final PhotodProvider _provider = PhotodProvider();

  @override
  void initState() {
    super.initState();
    _provider.openDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: FutureBuilder<List<MyPhotos>>(
        future: _provider.getPhotos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MyPhotos>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final List<MyPhotos> photos = snapshot.data!;
              return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  final MyPhotos photo = photos[index];
                  return ListTile(
                    leading: Image.network(photo.src),
                    title: Text(photo.photographer),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
