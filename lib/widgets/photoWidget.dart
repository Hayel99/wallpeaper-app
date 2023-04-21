import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget({required this.imgUrl, required this.title});
  var imgUrl;
  var title;
  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(imgUrl),
              ),
              width: 178,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
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
  }
}
