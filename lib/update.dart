import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';

class update extends StatelessWidget {
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
      body: Column(
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
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("New courses will be released soon.....................", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,),),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
