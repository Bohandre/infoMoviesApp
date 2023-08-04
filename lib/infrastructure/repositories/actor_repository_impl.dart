import 'package:info_movies/domain/datasources/actors_datadource.dart';
import 'package:info_movies/domain/entities/actor.dart';
import 'package:info_movies/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
