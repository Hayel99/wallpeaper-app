import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/providers/getphotos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: ListTile(
                onTap: () {},
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
                  onPressed: () {},
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
                                        photo['url'],
                                      ),
                                    ),
                                    width: 178,
                                    height: 250,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'City',
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
