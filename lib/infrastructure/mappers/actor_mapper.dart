import 'package:info_movies/domain/entities/actor.dart';
import 'package:info_movies/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9556d16312333.5691dd2255721.jpg',
        character: cast.character,
      );
}
