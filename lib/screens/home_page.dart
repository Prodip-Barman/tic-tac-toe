import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayElement = ["", "", "", "", "", "", "", "", ""];
  int oScore = 0;
  int xScore = 0;
  int fillBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Player X",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Player O",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          onTapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              displayElement[index],
                              style: TextStyle(color: getColor(displayElement[index]),fontSize: 36
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: clearScoreBoard,
                      child: Text(
                        'Clear Score Board',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Color getColor(String player) {
    if (player == "O") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = "";
      }
      fillBoxes = 0;
    });
  }

  void clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;

      for (int i = 0; i < 9; i++) {
        displayElement[i] = "";
      }
      fillBoxes = 0;
    });
  }

  void onTapped(int index) {
    setState(() {
      if (oTurn && displayElement[index] == "") {
        displayElement[index] = "O";
        fillBoxes++;
      } else if (!oTurn && displayElement[index] == "") {
        displayElement[index] = "X";
        fillBoxes++;
      }
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    // check by row
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != "") {
      showWinDialog(displayElement[0]);
    }

    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != "") {
      showWinDialog(displayElement[3]);
    }

    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != "") {
      showWinDialog(displayElement[6]);
    }

    //check cy column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != "") {
      showWinDialog(displayElement[0]);
    }

    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != "") {
      showWinDialog(displayElement[1]);
    }

    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != "") {
      showWinDialog(displayElement[2]);
    }

    //check diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != "") {
      showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != "") {
      showWinDialog(displayElement[2]);
    }else if(fillBoxes == 9){
      showDrawDialog();
    }
  }

  void showWinDialog(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!",),
            actions: [
              TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.pop(context);
                },
                child: Text("Play Again",style: TextStyle(fontSize: 20),),
              )
            ],
          );
        });
    if (winner == "O") {
      oScore++;
    } else {
      xScore++;
    }
  }

  void showDrawDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.pop(context);
                },
                child: Text("Play Again",style: TextStyle(fontSize: 20),),
              )
            ],
          );
        });
  }
}
