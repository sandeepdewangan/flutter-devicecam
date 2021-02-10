import 'package:devicecam/provider/great_places.dart';
import 'package:devicecam/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'places-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(child: const Text('No places to display!')),
        builder: (ctx, greatPlaces, staticChild) => greatPlaces.places.length <=
                0
            ? staticChild
            : ListView.builder(
                itemCount: greatPlaces.places.length,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(greatPlaces.places[i].image),
                    ),
                    title: Text(greatPlaces.places[i].title),
                    onTap: () {},
                  );
                }),
      ),
    );
  }
}
