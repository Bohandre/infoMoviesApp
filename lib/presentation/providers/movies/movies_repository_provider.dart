import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_movies/infrastructure/datasources/moviedb_datasource.dart';
import 'package:info_movies/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
