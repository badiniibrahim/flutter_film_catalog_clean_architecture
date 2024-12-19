import 'package:film_catalog/domain/entities/genre_entity.dart';

class GenreModel {
  final int? id;
  final String? name;

  String? error;

  GenreModel({this.id, this.name});

  factory GenreModel.fromJson(dynamic json) {
    if (json == null) {
      return GenreModel();
    }
    return GenreModel(id: json['id'], name: json['name']);
  }

  GenreEntity toEntity() {
    return GenreEntity(id: id, name: name);
  }
}
