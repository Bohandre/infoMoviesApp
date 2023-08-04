import 'package:dio/dio.dart';
import 'package:info_movies/config/constants/environment.dart';
import 'package:info_movies/domain/datasources/actors_datadource.dart';
import 'package:info_movies/domain/entities/actor.dart';
import 'package:info_movies/infrastructure/mappers/actor_mapper.dart';
import 'package:info_movies/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasourse extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits',
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
