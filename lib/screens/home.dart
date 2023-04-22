import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/providers/getphotos.dart';
import 'package:wallpaper/screens/favorites.dart';
import 'package:wallpaper/screens/search.dart';

import '../myphotos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    Provider.of<PhotodProvider>(context, listen: false).openDb();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoritesPage()));
                },
                title: Text(
                  'feavorits ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                )
              ],
              elevation: 0,
              title: Text(
                'JOSEQUAL WALLPAPERS',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: ChangeNotifierProvider(
                create: (context) => PhotodProvider(),
                child: Consumer<PhotodProvider>(
                    builder: (context, provider, child) {
                  provider.fetchPhotos();
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 300,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: provider.photos.length,
                        itemBuilder: (BuildContext context, index) {
                          final photo = provider.photos[index];
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 400.0,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
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
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              var myPhoto = MyPhotos(
                                                  id: photo['id'],
                                                  src: photo['src']['medium'],
                                                  photographer:
                                                      photo['photographer']);
                                              Provider.of<PhotodProvider>(
                                                      context,
                                                      listen: false)
                                                  .insertPhoto(myPhoto);
                                            },
                                            icon: Icon(
                                              FontAwesomeIcons.heart,
                                              color: Colors.red,
                                              size: 40,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
                }))));
  }
}
