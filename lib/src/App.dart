import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/ImageSchema.dart';
import 'widgets/ImageList.dart';

class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }

}
 class AppState extends State<App> {
  int counter = 0;
  List<ImageSchema> images = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Let's see some images"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }

  void fetchImage() async {
    counter+=1;
    var response = await get("https://jsonplaceholder.typicode.com/photos/$counter");
    var imageSchema = ImageSchema.fromJson(json.decode(response.body));

    //used setState to notify flutter that we have something to render on the screen
    setState(() {
      images.add(imageSchema);
    });

  }
}