import 'package:devicecam/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _places = [];

  List<Place> get places {
    return [... _places];
  }
}