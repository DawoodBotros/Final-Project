class Movie {
  int? id;
  String? backdropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? status;
  String? tagline;
  String? title;
  double? voteAverage;

  Movie({
    this.id,
    this.backdropPath,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    voteAverage = double.parse(json['vote_average'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['backdrop_path'] = this.backdropPath;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    return data;
  }
}
