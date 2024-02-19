import 'package:flappy_bird/game/assets/assets.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameOver';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                  fontSize: 60, color: Colors.white, fontFamily: 'Game'),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: onRestart,
                child: const Text(
                  'RESTART',
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: gotoMainMenu,
                child: const Text(
                  'Main Menu',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  onRestart() {
    game.bird.reset();
  }

  gotoMainMenu() {
    game.bird.gotoMainMenu();
  }
}
