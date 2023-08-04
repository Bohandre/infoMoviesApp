import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_movies/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:info_movies/infrastructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasourse());
});
