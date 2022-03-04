import 'package:flutter/material.dart';

class FinishPage extends StatefulWidget {
  bool isWin;
  int no;

  FinishPage(this.isWin, this.no);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finish Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.isWin ? "YOU WIN" : "YOU LOST",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(widget.isWin
                      ? "images/happyface.png"
                      : "images/sadface.png")),
            ),
            Text("The number is ${widget.no}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Restart?"))
          ],
        ),
      ),
    );
  }
}
