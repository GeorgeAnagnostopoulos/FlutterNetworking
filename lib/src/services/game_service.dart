import 'package:fpdart/fpdart.dart';
import 'package:myapp/src/models/game.dart';
import 'package:myapp/src/services/base_service.dart';

class GameService extends BaseService {
  static const basePath = '/spiele';

  Future<Either<String, List<Game>>> list() async {
    final response = await get(basePath);
    return response.fold(
      (error) => left(error.toString()),
      (result) => right(result['data'].map<Game>((json) => Game.fromJson(json)).toList()),
    );
  }
  
  Future<Either<String, Game>> retrieve(String id) async {
    final response = await get("$basePath/$id");
    return response.fold(
      (error) => left(error.toString()),
      (result) => right(Game.fromJson(result['data'])),
    );
  }

  Future<Either<String, Game>> _create(Game game) async {
    final response = await post(basePath, data: game.toJson());
    return response.fold(
      (error) => left(error.toString()),
      (result) => right(Game.fromJson(result['data'])),
    );
  }
  
  Future<Either<String, Game>> _update(String id, Game game) async {
    final response = await patch("$basePath/$id", data: game.toJson());
    return response.fold(
      (error) => left(error.toString()),
      (result) => right(Game.fromJson(result['data'])),
    );
  }

  Future<Either<String, bool>> remove(String id) async {
    final response = await delete("$basePath/$id");
    return response.fold(
      (error) => left(error.toString()),
      (result) => right(true),
    );
  }

  Future<Either<String, Game>> save(Game game) async => game.id.isEmpty ? _create(game) : _update(game.id, game);
  
}
