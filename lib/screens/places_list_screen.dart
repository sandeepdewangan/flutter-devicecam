import 'package:devicecam/screens/add_place_screen.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'places-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: ()=> Navigator.of(context).pushNamed(AddPlaceScreen.routeName),),
        ],
      ),
      body: Container(
        child: Text('My Places Container'),
      ),
    );
  }
}
