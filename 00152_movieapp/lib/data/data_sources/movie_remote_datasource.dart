import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

abstract class MoveRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MoveRemoteDataSourceImpl extends MoveRemoteDataSource {
  final Client _client;

  MoveRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    return await _getMovies(
      '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.apiKey}',
    );
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    return await _getMovies(
      '${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.apiKey}',
    );
  }

  Future<Response> _get(String url) async {
    final response = await _client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<MovieModel>> _getMovies(String url) async {
    final response = await _get(url);
    final responseBody = json.decode(response.body);
    final movies = MoviesResultModel.fromJson(responseBody).moveies;
    print(movies);
    return movies;
  }
}
