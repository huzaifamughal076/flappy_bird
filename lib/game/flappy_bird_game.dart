import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird/game/Bird/bird.dart';
import 'package:flappy_bird/game/Configuration/configuration.dart';
import 'package:flappy_bird/game/Pipes/pipe_group.dart';
import 'package:flappy_bird/game/components/backgound.dart';
import 'package:flappy_bird/game/components/ground.dart';
import 'package:flutter/widgets.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Backgound(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore()
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "Score 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Game')));
  }
}
