import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  File _image;
  void getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("SMOL")),
        body: Column(children: <Widget>[
          FloatingActionButton(
              child: Icon(Icons.photo_library),
              onPressed: () => getGalleryImage()),
          _image == null ? Text('No image') : Image.file(_image, width: 200),
          RaisedButton(
              child: Text('move to login page'),
              onPressed: () {
                // Named route를 사용하여 두 번째 화면으로 전환합니다.
                Navigator.pushNamed(context, '/login');
              })
        ]));
  }
}
