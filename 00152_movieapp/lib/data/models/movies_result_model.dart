// @dart=2.9

import 'movie_model.dart';

class MoviesResultModel {
  List<MovieModel> moveies;

  MoviesResultModel({this.moveies});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      moveies = new List<MovieModel>();
      json['results'].forEach((v) {
        moveies.add(new MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moveies != null) {
      data['results'] = this.moveies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
