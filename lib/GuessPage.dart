import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guess_the_number/FinishPage.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({Key? key}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int heart = 5;
  int theNumber = 0;
  var inputNo = TextEditingController();
  String help = "";

  @override
  void initState() {
    super.initState();
    var rnd = Random();
    theNumber = rnd.nextInt(101);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Kalan Hak: $heart ",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$help ",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputNo,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Guess",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    heart = heart - 1;
                    help;
                  });
                  if (int.parse(inputNo.text.toString()) == theNumber) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinishPage(true, theNumber)));
                    return;
                  }

                  if (int.parse(inputNo.text.toString()) > theNumber) {
                    setState(() {
                      help = "decrease the number.";
                    });
                  }

                  if (int.parse(inputNo.text.toString()) < theNumber) {
                    setState(() {
                      help = "increase the number.";
                    });
                  }

                  if (heart == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FinishPage(false, theNumber)));
                  }

                  inputNo.text = "";

                  //
                },
                child: Text("Guess The Number")),
          ],
        ),
      ),
    );
  }
}
