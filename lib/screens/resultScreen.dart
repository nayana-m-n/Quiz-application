import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int highScore;
  final int currentScore;
  const ResultScreen(
      {required this.highScore, required this.currentScore, super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: gradientappbarmobile(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
              Center(
                child: Text(
                  'Highest Score is $highScore',
                  style: const TextStyle(
                    fontSize: 28,
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
              ),
              const Text("Congratulations, You have completed the Quiz",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
                textAlign: TextAlign.center,
              ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
              Center(
                child: Text(
                  'Your Score is $currentScore /3',
                  style:  TextStyle(
                    fontSize: 20,
                    wordSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                    color: currentScore >= 2 ? Colors.green:Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              // cusH,
            ],
          ),
        ),
      ),
    );
  }
  gradientappbarmobile(context) {
    return  AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 80.0,
      automaticallyImplyLeading: false,
      leading: IconButton(icon: Icon(Icons.arrow_back,size: 20, color: Colors.white),onPressed: () {
        backPress(context);
      }),
      titleSpacing: 0,
    );
  }
  backPress(context) async{
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Quit Quiz?'),
          content: const Text(
            'Are you sure you want exit!',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => exit(0)));
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }
}
