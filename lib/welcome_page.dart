import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/game_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 35),
                child: const Text(
                  'Welcome to Jumanji',
                  style: TextStyle(
                      fontFamily: 'PressStart',
                      fontSize: 19,
                      color: Colors.green),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const AvatarGlow(
              glowColor: Colors.red,
              startDelay: Duration(seconds: 1),
              duration: Duration(seconds: 3),
              endRadius: 180,
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/img.png'),
                radius: 100,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'Let\'s Play',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
