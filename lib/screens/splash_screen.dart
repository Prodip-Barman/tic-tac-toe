import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
            child: Text(
              "TIC TAC TOE",
              style:
                  TextStyle(fontFamily: "Press_Start_2P", color: Colors.white, fontSize: 32.0),
            ),
            alignment: Alignment.center,
          ),
          Container(
            child: Image.asset(
              "assets/image/tictac.png",
              color: Colors.white,
              height: 300,
              width: 300,
            ),
          ),
          Container(
            height: 60,
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Play Game",
                style:
                TextStyle(fontFamily: "Press_Start_2P", color: Colors.black, fontSize: 20.0),
              ),
              style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
          Text("Created By Prodip Barman",
            style:
            TextStyle(fontFamily: "Press_Start_2P", color: Colors.white, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
