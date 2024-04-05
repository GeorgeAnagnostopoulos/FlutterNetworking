import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/src/providers/game_list_provider.dart';

class GameDetailsView extends ConsumerWidget {
  const GameDetailsView({
    super.key,
    required this.gameId,
  });

  final String gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameDetailsProvider(gameId));
    return Scaffold(
      appBar: game.when(
          data: (data) {
            return AppBar(
              title: Text(
                data?.name ?? "Not Found",
              ),
              actions: [
                if (data != null)
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                      ))
              ],
            );
          },
          error: (error, _) => AppBar(
                title: Text(
                  error.toString(),
                ),
              ),
          loading: () => AppBar()),
      body: game.when(
        data: (data) {
          if (data == null) {
            return Center(child: Text("Not Found"));
          }
          return Center(
              child: Text(
            data.name,
          ));
        },
        error: (e, _) => Center(
          child: Text(
            e.toString(),
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
