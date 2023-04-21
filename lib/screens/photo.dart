import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Photo Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(
          color: Colors.white,
          elevation: 10,
          shadowColor: Colors.grey,
          child: Column(
            children: [
              Container(
                child: Image(
                  image: NetworkImage(
                      'https://i0.wp.com/artisthue.com/wp-content/uploads/2023/01/city-Iphone-wallpaper-1.webp?fit=436%2C775&ssl=1'),
                ),
                width: 308,
                height: 600,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'sltr',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.heart_broken,
                                size: 35,
                              )),
                        )
                      ],
                    ),
                    Text(
                      'Tacken by jhfkjnfks',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
