import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class GetComingSoon {
  final MovieRepository repository;

  GetComingSoon(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await repository.getComingSoon();
  }
}
