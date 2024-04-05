import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/src/models/game.dart';
import 'package:myapp/src/services/game_service.dart';

class GameListProvider extends StateNotifier<List<Game>> {
  GameListProvider() : super([]) {
    _load();
  }

  Future<void> _load() async {
    final response = await GameService().list();
    response.fold(
      (error) => print(error.toString()),
      (games) => state = games,
    );
  }
}

final gameListProvider = StateNotifierProvider<GameListProvider, List<Game>>(
  (ref) => GameListProvider(),
);

final gameDetailsProvider =
    FutureProvider.family<Game?, String>((ref, id) async {
  final result = await GameService().retrieve(id);
  return result.fold(
    (error) {
      print(error);
      return null;
    },
    (game) => game,
  );
});
