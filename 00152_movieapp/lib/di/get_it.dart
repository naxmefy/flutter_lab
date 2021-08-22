import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_sources/movie_remote_datasource.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_coming_soon.dart';
import 'package:movieapp/domain/usecases/get_playing_now.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';

final di = GetIt.I;

Future init() async {
  /// All dependencies goes here+
  di.registerLazySingleton<Client>(() => Client());
  di.registerLazySingleton<ApiClient>(() => ApiClient(di()));
  di.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(di()));

  di.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(di()));

  di.registerLazySingleton<GetTrending>(() => GetTrending(di()));
  di.registerLazySingleton<GetPopular>(() => GetPopular(di()));
  di.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(di()));
  di.registerLazySingleton<GetComingSoon>(() => GetComingSoon(di()));
}
