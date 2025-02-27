import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Assumes a global "navigatorKey" is defined here

class CardPortfolioGame extends FlameGame {
  @override
  Future<void> onLoad() async {
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