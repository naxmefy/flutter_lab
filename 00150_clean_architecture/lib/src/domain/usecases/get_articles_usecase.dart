import 'package:cleanarchitecture/src/core/params/articles_request.dart';
import 'package:cleanarchitecture/src/core/resources/data_state.dart';
import 'package:cleanarchitecture/src/core/usecases/usecase.dart';
import 'package:cleanarchitecture/src/domain/entities/article.dart';
import 'package:cleanarchitecture/src/domain/repositories/articles_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetArticlesUseCase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({
    required ArticlesRequestParams params,
  }) {
    return _articlesRepository.getBreakingNewsArticles(params);
  }
}
