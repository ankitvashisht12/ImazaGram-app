import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'image_list.dart';
import 'dart:convert';


main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Imazagram',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  int id = 0;
  //String url = 'http://jsonplaceholder.typicode.com/photos/$id';
  List<ImageModel> images = [];

  fetchImage() async{
    id++;
    print(' id is $id');
    var response = await get('http://jsonplaceholder.typicode.com/photos/$id');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
   
    //print('imageModel print is ${imageModel.url}');
    setState(() {
      images.add(imageModel);
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Imazagram'),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
    );
  }
}