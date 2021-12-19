import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/theory_questions.dart';

class Theories extends StatefulWidget {
  @override
  _TheoriesState createState() => _TheoriesState();
}

class _TheoriesState extends State<Theories> {
  int _counter = 0;
  double _animOpacity = 0;

  void _increasecounter(){
    setState(() {
      if(_counter != TheoryQuestion.sampleData.length - 1){
        _counter = _counter + 1;
        _animOpacity = 0;
      }else{
        Fluttertoast.showToast(
          msg: "This is the Last question",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.green,
          fontSize: 12,
        );
      }
    });
  }
  @override
  void _decreasecounter(){
    setState(() {
      if(_counter != 0){
        _counter = _counter - 1;
        _animOpacity = 0;
      }else{
        Fluttertoast.showToast(
          msg: "This is the first question",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.green,
          fontSize: 12,
        );
      }
    });
  }

  late Future questionsFuture;

  Future questions() async {
    await Future.delayed(Duration(seconds: 1));
    var completer = new Completer();
    completer.complete(TheoryQuestion.sampleData);
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
            if (snapshot.hasData) {
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
                        snapshot.data[_counter]["question"].toString(), // this part is used to pass the questions to screen
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if(_animOpacity == 0){
                            _animOpacity = 1;
                          } else if(_animOpacity == 1){
                            _animOpacity = 0;
                          }
                        });
                      },
                      splashColor: Colors.green.shade700,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green.shade700,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),

                        child: Text(
                          _animOpacity == 0 ? "Show Answers" : "Hide Answers", // this if for show/hide answer button
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AnimatedOpacity(
                        opacity: _animOpacity,
                        duration: Duration(milliseconds: 0),
                        child: Text(snapshot.data[_counter]["answer"].toString(), style: TextStyle(fontSize: 20), textAlign: TextAlign.center), // this is to display the answer  read from theory questions
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
                          MaterialButton(
                            onPressed: () {
                              _decreasecounter();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,// back arrow
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text("${snapshot.data[_counter]["id"]}/${snapshot.data.length}"), // number of questions count
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                          ),
                          MaterialButton(
                            onPressed: () {
                              _increasecounter();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded, // forward arrow
                                color: Colors.white,
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
                        MaterialPageRoute(builder: (context) => Home()), // home route incase of error
                      );
                    },
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.green), // home button
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

  Widget choiceButton(var answer) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.green.shade700,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green.shade700,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          answer,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
