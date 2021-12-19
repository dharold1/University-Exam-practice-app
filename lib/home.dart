
import 'package:flutter/material.dart';
import 'package:untitled2/quizspace.dart';
import 'package:untitled2/theories.dart';
import 'package:untitled2/update.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              customCard("CSC101", QuizSpace()),
              customCard("CSC402", Theories()),
              customCard("More practice courses coming soon", update()),
              customCard("More practice courses coming soon", update()),
            ],
          ),
        ),
        drawer: Container(),
      );
    }

  Widget customCard(String courseTitle, var navigateTo) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => navigateTo,
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(
          20.0,
        ),
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              courseTitle,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}