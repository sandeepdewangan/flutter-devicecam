import 'dart:io';

import 'package:devicecam/helper/db_helper.dart';
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
     // save into sql
    DbHelper.insert('user_places', {'id': newPlace.id, 'title': newPlace.title, 'image': newPlace.image.path});
  }

  Future<void> fetchAndSetPlaces() async{
    final dataList = await DbHelper.getData('user_places');
    _places = dataList.map((e) => Place(id: e['id'], title: e['title'], location: null, image: File(e['id']))).toList();
    notifyListeners();
  }
}