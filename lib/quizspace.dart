import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/questions.dart';
import 'package:untitled2/scores.dart';

class QuizSpace extends StatefulWidget {
  @override
  _QuizSpaceState createState() => _QuizSpaceState();
}

class _QuizSpaceState extends State<QuizSpace> {
  int _counter = 0;
  int answer = 0;
  bool firstOption = false;
  bool secondOption = false;
  bool thirdOption = false;
  bool fourthOption = false;
  int score = 0;

  void _increasecounter(BuildContext context, int score, int totalScore) {
    setState(() {
      if (_counter != Question.sampleData.length - 1) {
        _counter = _counter + 1;
        firstOption = false;
        secondOption = false;
        thirdOption = false;
        fourthOption = false;
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Score(score, totalScore)));
      }
    }); // this works on calculating total score and counter for question movement these are just declared variables though
  }

  @override

  late Future questionsFuture;

  Future questions() async {
    await Future.delayed(Duration(seconds: 1));
    var completer = new Completer();
    completer.complete(Question.sampleData);
    print(completer.future);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    questionsFuture = questions();
  }

  Widget build(BuildContext context) {
    // print(_questions.length);
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 140),
            child: Container(
              height: 140,
              width: double.infinity,
              color: Colors.green.shade700,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/png/uniabuja.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Uniabuja Practice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            )),
        body: FutureBuilder(
          future: questionsFuture,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) { // check if snapshot can read from questions
              return Column(
                children: [
                  TextButton.icon(
                    icon: Icon(
                      Icons.home,
                      color: Colors.green.shade700,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: Text(
                        snapshot.data[_counter]["question"].toString(), // read questions from file to screen
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                answer = 0;
                                if (answer ==
                                    snapshot.data[_counter]["answer_index"]) {
                                  firstOption = true;
                                  score++;
                                }

                                switch (snapshot.data[_counter]
                                    ["answer_index"]) {
                                  case 0:
                                    firstOption = true;
                                    break;
                                  case 1:
                                    secondOption = true;
                                    break;
                                  case 2:
                                    thirdOption = true;
                                    break;
                                  case 3:
                                    fourthOption = true;
                                    break;
                                  default:
                                    break;
                                }
                              }); // answer/ total score implementation
                            },
                            splashColor: Colors.green.shade700,
                            child: choiceButton(
                                snapshot.data[_counter]["options"][0]
                                    .toString(),
                                firstOption),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                answer = 1;
                                if (answer ==
                                    snapshot.data[_counter]["answer_index"]) { //this passes the answers based on current counter number
                                  secondOption = true;
                                  score++;
                                }

                                switch (snapshot.data[_counter]
                                    ["answer_index"]) {
                                  case 0:
                                    firstOption = true;
                                    break;
                                  case 1:
                                    secondOption = true;
                                    break;
                                  case 2:
                                    thirdOption = true;
                                    break;
                                  case 3:
                                    fourthOption = true;
                                    break;
                                  default:
                                    break;
                                }
                              });
                            },
                            splashColor: Colors.green.shade700,
                            child: choiceButton(
                                snapshot.data[_counter]["options"][1]
                                    .toString(),
                                secondOption),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                answer = 2;
                                if (answer ==
                                    snapshot.data[_counter]["answer_index"]) {
                                  thirdOption = true;
                                  score++;
                                }

                                switch (snapshot.data[_counter]
                                    ["answer_index"]) {
                                  case 0:
                                    firstOption = true;
                                    break;
                                  case 1:
                                    secondOption = true;
                                    break;
                                  case 2:
                                    thirdOption = true;
                                    break;
                                  case 3:
                                    fourthOption = true;
                                    break;
                                  default:
                                    break;
                                }
                              });
                            },
                            splashColor: Colors.green.shade700,
                            child: choiceButton(
                                snapshot.data[_counter]["options"][2]
                                    .toString(),
                                thirdOption),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                answer = 3;
                                if (answer ==
                                    snapshot.data[_counter]["answer_index"]) {
                                  fourthOption = true;
                                  score++;
                                }

                                switch (snapshot.data[_counter]
                                    ["answer_index"]) {
                                  case 0:
                                    firstOption = true;
                                    break;
                                  case 1:
                                    secondOption = true;
                                    break;
                                  case 2:
                                    thirdOption = true;
                                    break;
                                  case 3:
                                    fourthOption = true;
                                    break;
                                  default:
                                    break;
                                }
                              });
                            },
                            splashColor: Colors.green.shade700,
                            child: choiceButton(
                                snapshot.data[_counter]["options"][3]
                                    .toString(),
                                fourthOption),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text("${snapshot.data[_counter]["id"]}/${snapshot.data.length}"), // number of questions count
                          ),
                          Flexible(
                            flex: 1,
                            child: MaterialButton(
                              onPressed: () {
                                _increasecounter(context, score, snapshot.data.length);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  TextButton.icon(
                    icon: Icon(
                      Icons.home,
                      color: Colors.green.shade700,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Error"),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 5,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget choiceButton(var answer, bool option) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: option ? Colors.green : Colors.white,
          border: Border.all(
            color: Colors.green.shade700,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        answer,
        style: TextStyle(
            fontSize: 20, color: option ? Colors.white : Colors.black),
      ),
    );
  }
}
