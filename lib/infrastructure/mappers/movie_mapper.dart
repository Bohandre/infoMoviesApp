import 'package:info_movies/domain/entities/movie.dart';
import 'package:info_movies/infrastructure/models/moviedb/movie_details.dart';
import 'package:info_movies/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9556d16312333.5691dd2255721.jpg',
        releaseDate:
            moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',
        genreIds: moviedb.genres.map((e) => e.name).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9556d16312333.5691dd2255721.jpg',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );
}
