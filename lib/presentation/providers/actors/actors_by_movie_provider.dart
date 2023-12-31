import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:info_movies/domain/entities/actor.dart';
import 'package:info_movies/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

/*
  {
    '505642': <Actor>[],
    '505643': <Actor>[],
    '505645': <Actor>[],
    '505631': <Actor>[],
  }
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    // print('Realizando petición http');

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
