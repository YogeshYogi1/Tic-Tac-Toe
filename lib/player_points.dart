import 'package:flutter/material.dart';
import 'game_page.dart';

class playerPoints extends StatelessWidget {
  playerPoints({
    Key? key,
    required this.xscore,
    required this.text,
    required this.color,
  }) : super(key: key);

  final int xscore;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 20, top: 50),
          child: Text(
            text,
            style:
                TextStyle(fontSize: 18, color: color, fontFamily: 'PressStart'),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          xscore.toString(),
          style:
              TextStyle(fontSize: 20, color: color, fontFamily: 'PressStart'),
        ),
      ],
    );
  }
}
