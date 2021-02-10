import 'dart:io';

import 'package:devicecam/provider/great_places.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = 'add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File _pickedImage;
  final _titleController = TextEditingController();

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile == null){
      return;
    }
    setState(() {
      _pickedImage = File(imageFile.path);
    });
    // app data directory path_provider package
    final appDir = await syspath.getApplicationDocumentsDirectory();
    // get file name using path package
    final fileName = path.basename(imageFile.path);
    final savedImage = await _pickedImage.copy('${appDir.path}/$fileName');
  }

  void _saveImage(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
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
                    controller: _titleController,
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
                        child: _pickedImage != null
                            ? Image.file(
                                _pickedImage,
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
              onPressed: _saveImage,
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
