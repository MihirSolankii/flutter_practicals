import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("practical 3")),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(

            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
                child: Icon(Icons.home_outlined),
              ),
              SizedBox(height: 20), // Spacing between widgets
              Text(
                "Hello Flutter",
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
