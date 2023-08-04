import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_movies/domain/entities/movie.dart';
import 'package:info_movies/presentation/providers/providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
