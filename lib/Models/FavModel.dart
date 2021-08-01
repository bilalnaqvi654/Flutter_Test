import 'dart:convert';

class FavouriteModel {
  late final String name, description, imageUrl, alchohlic;

  late int id;
  FavouriteModel(
    this.name,
    this.description,
    this.imageUrl,
    this.alchohlic,
    this.id,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'alchohlic': alchohlic,
    };
    return map;
  }

  FavouriteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    alchohlic = map['alchohlic'];
    imageUrl = map['imageUrl'];
  }
}
