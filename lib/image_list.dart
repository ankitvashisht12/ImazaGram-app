import 'package:flutter/material.dart';
import 'models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> image;
  ImageList(this.image);

  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: image.length,
      itemBuilder: (context, int  index){
        // print('index is $index');
        // print(image[index].url);
        return Column(
          children: <Widget>[
            Image.network(image[index].url),
            Text(image[index].title),
          ],
        );
      },
    );
  }
}