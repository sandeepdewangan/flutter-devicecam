import 'dart:io';

import 'package:devicecam/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _places = [];

  List<Place> get places {
    return [... _places];
  }

  void addPlace(String title, File image){
     final newPlace = Place(id: DateTime.now().toString(), title: title, location: null, image: image);
     _places.add(newPlace);
     notifyListeners();
  }
}