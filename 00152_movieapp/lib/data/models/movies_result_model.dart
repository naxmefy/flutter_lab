import 'movie_model.dart';

class MoviesResultModel {
  final List<MovieModel> movies;

  MoviesResultModel({required this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    var movies = List<MovieModel>.empty();
    if (json['results'] != null) {
      movies = List.from(json['results']).map((v) {
        return new MovieModel.fromJson(v);
      }).toList();
    }
    return MoviesResultModel(
      movies: movies,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
