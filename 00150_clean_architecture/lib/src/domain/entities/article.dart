import 'package:cleanarchitecture/src/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String pushedAt;
  final String content;

  const Article({
    required this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.pushedAt,
    required this.content,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      pushedAt,
      content,
    ];
  }
}
