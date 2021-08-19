// @dart=2.9

class MovieModel {
  bool video;
  double voteAverage;
  String overview;
  String releaseDate;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  double popularity;
  String mediaType;

  MovieModel(
      {this.video,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.adult,
      this.backdropPath,
      this.voteCount,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.title,
      this.popularity,
      this.mediaType});

  MovieModel.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
