import 'package:flutter/material.dart'; void main() {
  runApp(MaterialApp( debugShowCheckedModeBanner: false, home: Scaffold(
    appBar: AppBar(
      title: Text('Practical 4'),
    ),
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text('hello1'), Icon(Icons.home), Text('hello2'),
      RichText(
          text: TextSpan( children: [
            TextSpan(text: 'hello4',style: TextStyle(color: Colors.green))
          ],
              text: 'hello3', style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue)
          )
      )
    ],
    ),
  ),
  ));
}
