import 'package:flutter/material.dart';

class XOLayout extends StatelessWidget {
  XOLayout(
      {Key? key,
      required this.index,
      required this.onTap,
      required this.xo,
      required this.color})
      : super(key: key);
  final int index;
  final Function onTap;
  final List xo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          onTap(index);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: xo[index] == '' ? Colors.grey.shade700 : color, width: 2),
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              xo[index],
              //index.toString(),
              style: TextStyle(
                  fontSize: 26, color: color, fontFamily: 'PressStart'),
            ),
          ),
        ),
      ),
    );
  }
}
