import 'package:flutter/material.dart';
import 'package:myapp/src/models/game.dart';
import 'package:myapp/src/views/game_details_view.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          game.name,
        ),
        subtitle: Text(
          game.console,
        ),
        leading: Image.network(
          game.photo,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
        trailing: Icon(Icons.chevron_right_outlined),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GameDetailsView(gameId: game.id),
            ),
          );
        },
      ),
    );
  }
}
