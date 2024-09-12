class Movie {
  final String? title;
  final String? year;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? posterUrl;
  final String? imdbRating;

  Movie({
    this.title,
    this.year,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.posterUrl,
    this.imdbRating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["Title"],
      year: json["Year"],
      released: json["Released"],
      runtime: json["Runtime"],
      genre: json["Genre"],
      director: json["Director"],
      writer: json["Writer"],
      actors: json["Actors"],
      plot: json["Plot"],
      language: json["Language"],
      country: json["Country"],
      awards: json["Awards"],
      posterUrl: json["Poster"],
      imdbRating: json["imdbRating"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Released": released,
        "Runtime": runtime,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Plot": plot,
        "Language": language,
        "Country": country,
        "Awards": awards,
        "Poster": posterUrl,
        "imdbRating": imdbRating,
      };

  @override
  String toString() {
    return "$title, $year, $released, $runtime, $genre, $director, $writer, $actors, $plot, $language, $country, $awards, $posterUrl, $imdbRating";
  }
}
