import 'package:flutter/material.dart';
import 'package:myapp/src/components/game_list.dart';

class GameListView extends StatelessWidget {
  const GameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("G A M E S")),
      body: GameList(),
    );
  }
}
