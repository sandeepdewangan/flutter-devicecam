import 'dart:io';

import 'package:flutter/material.dart';

class PlaceLocation{
  final double lat;
  final double long;
  final String address;

  PlaceLocation({@required this.lat, @required this.long, @required this.address});

}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({this.id, this.title, this.location, this.image});


}