import 'package:cleanarchitecture/src/core/utils/constants.dart';

class ArticlesRequestParams {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  const ArticlesRequestParams({
    this.apiKey = kApiKey,
    this.country = 'de',
    this.category = 'general',
    this.page = 1,
    this.pageSize = 20
  });
}