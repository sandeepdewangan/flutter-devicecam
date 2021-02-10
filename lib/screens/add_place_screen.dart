import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = 'add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: _storedImage != null
                            ? Image.file(
                                _storedImage,
                                fit: BoxFit.cover,
                              )
                            : Text(
                                'No Image Taken',
                                textAlign: TextAlign.center,
                              ),
                      ),
                      FlatButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Take Picture',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                        onPressed: _takePicture,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 8,
          ),
          Expanded(
            child: FlatButton(
              color: Theme.of(context).accentColor,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Add Place'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
