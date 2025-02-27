import 'dart:math'; // for random numbers
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Assumes a global "navigatorKey" is defined here

// New: Spawner for flying background cards.
class FlyingCardBackground extends Component with HasGameRef<CardPortfolioGame> {
  final Random _rand = Random();
  double spawnTimer = 0;
  double nextSpawn = 1; // spawn an image every ~1-3 seconds

  @override
  void update(double dt) {
    spawnTimer += dt;
    if (spawnTimer >= nextSpawn) {
      spawnTimer = 0;
      nextSpawn = 1 + _rand.nextDouble() * 2;      
      final x = _rand.nextDouble() * gameRef.size.x;
      final speed = 100 + _rand.nextDouble() * 100;
      gameRef.add(FlyingCardComponent(
        position: Vector2(x, gameRef.size.y + 50),
        speed: speed,
      ));
    }
  }
}

// New: Each flying card component.
class FlyingCardComponent extends SpriteComponent with HasGameRef<CardPortfolioGame> {
  final double speed;  
  FlyingCardComponent({required Vector2 position, required this.speed})
      : super(position: position, size: Vector2(100, 150), priority: -2);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('Cardback.png');
  }

  @override
  void update(double dt) {
    position.add(Vector2(0, -speed * dt));
    if (position.y + size.y < 0) {
      removeFromParent();
    }
  }
}

class CardPortfolioGame extends FlameGame with TapDetector {
  @override
  Future<void> onLoad() async {
    // Add animated background first.
    add(FlyingCardBackground());

    final screenWidth = size.x;
    final cardWidth = 150;
    final spacing = (screenWidth - (3 * cardWidth)) / 4;

    addAll([
      CardComponent(position: Vector2(spacing, 200), label: 'My Info', route: '/info', image: 'Spades1.png'),
      CardComponent(position: Vector2(2 * spacing + cardWidth, 200), label: 'My Portfolio', route: '/projects', image: 'Spades2.png'),
      CardComponent(position: Vector2(3 * spacing + 2 * cardWidth, 200), label: 'Download CV', route: '/download_cv', image: 'Spades3.png'),
    ]);
  }
}

class CardComponent extends SpriteComponent with TapCallbacks, HoverCallbacks {
  final String label;
  final String route;
  final String image;

  CardComponent({required Vector2 position, required this.label, required this.route, required this.image})
      : super(position: position, size: Vector2(150, 200));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(image);
    add(TextComponent(
      text: label,
      position: Vector2(size.x / 2, size.y - 20),
      anchor: Anchor.center,
    ));
  }

  @override
  void onTapDown(TapDownEvent event) {
    Navigator.of(navigatorKey.currentContext!).pushNamed(route);
  }

  @override
  void onHoverEnter() {
    add(MoveEffect.by(Vector2(0, -10), EffectController(duration: 0.2)));
  }
  
  @override
  void onHoverExit() {
    add(MoveEffect.by(Vector2(0, 10), EffectController(duration: 0.2)));
  }
}