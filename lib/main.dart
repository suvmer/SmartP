//АМОГУС

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: Text(
            "Привет, чем займемся сегодня?",
            style: TextStyle(fontSize: 35),
          )),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              child: Text("Создать новый конструктор"), onPressed: () {}),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(child: Text("Посмотреть пример"), onPressed: () {}),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(child: Text("Список конструкторов"), onPressed: () {}),
        ],
      ),
    );
  }
}
//16:28
