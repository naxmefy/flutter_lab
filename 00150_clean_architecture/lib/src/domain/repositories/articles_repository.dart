import 'package:cleanarchitecture/src/core/resources/data_state.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params);
}