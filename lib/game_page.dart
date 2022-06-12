import 'package:flutter/material.dart';
import 'package:xo_game/player_points.dart';
import 'package:xo_game/xo_layout.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int xscore = 0;
  int oscore = 0;
  bool turns = true;
  int filledbox = 0;
  List xo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  onTap(index) {
    setState(
      () {
        if (turns && xo[index] == '') {
          filledbox++;
          xo[index] = 'X';
        } else if (!turns && xo[index] == '') {
          filledbox++;
          xo[index] = 'O';
        }
        turns = !turns;
        checkwinners();
      },
    );
  }

  void checkwinners() {
    if (xo[0] == xo[1] && xo[0] == xo[2] && xo[0] != '') {
      _showWinDialog(xo[0]);
    }
    if (xo[3] == xo[4] && xo[3] == xo[5] && xo[3] != '') {
      _showWinDialog(xo[3]);
    }
    if (xo[6] == xo[7] && xo[6] == xo[8] && xo[6] != '') {
      _showWinDialog(xo[6]);
    }
    if (xo[0] == xo[3] && xo[0] == xo[6] && xo[0] != '') {
      _showWinDialog(xo[0]);
    }
    if (xo[1] == xo[4] && xo[1] == xo[7] && xo[1] != '') {
      _showWinDialog(xo[1]);
    }
    if (xo[2] == xo[5] && xo[2] == xo[8] && xo[2] != '') {
      _showWinDialog(xo[2]);
    }
    if (xo[0] == xo[4] && xo[0] == xo[8] && xo[0] != '') {
      _showWinDialog(xo[0]);
    }
    if (xo[2] == xo[4] && xo[2] == xo[6] && xo[2] != '') {
      _showWinDialog(xo[2]);
    } else if (filledbox == 9) {
      _showDrawDialog();
    }
  }

  _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: [
            TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.pop(context);
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
  }

  _showWinDialog(winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Winner' + winner),
          actions: [
            TextButton(
                onPressed: () {
                  clearBoard();

                  Navigator.pop(context);
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
    if (winner == 'X') {
      xscore++;
    } else if (winner == 'O') {
      oscore++;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xo[i] = '';
      }
    });
    filledbox = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  playerPoints(
                      xscore: xscore, text: 'Player X', color: Colors.red),
                  const SizedBox(width: 30),
                  playerPoints(
                      xscore: oscore, text: 'Player O', color: Colors.green),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (_, index) {
                return XOLayout(
                    index: index,
                    onTap: onTap,
                    xo: xo,
                    color: xo[index] == 'X' ? Colors.red : Colors.green);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Container(
              height: 70,
              child: Column(
                children: const [
                  Text(
                    'TIC TAC TOE',
                    style: TextStyle(
                        fontFamily: 'PressStart',
                        color: Colors.green,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '@ CREATED BY YOGI',
                    style: TextStyle(
                      fontFamily: 'PressStart',
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
