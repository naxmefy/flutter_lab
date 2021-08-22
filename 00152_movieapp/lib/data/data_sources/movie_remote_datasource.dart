import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

abstract class MoveRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MoveRemoteDataSourceImpl extends MoveRemoteDataSource {
  final ApiClient _client;

  MoveRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    return await _getMovies('trending/movie/day');
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    return await _getMovies('movie/popular');
  }

  Future<List<MovieModel>> _getMovies(String path) async {
    final response = await _client.get(path);
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
