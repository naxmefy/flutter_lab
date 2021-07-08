import 'package:cleanarchitecture/src/core/params/articles_request.dart';
import 'package:cleanarchitecture/src/core/resources/data_state.dart';
import 'package:cleanarchitecture/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
