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
      home: const MyHomePage(title: 'Главная'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {Route route =
                      MaterialPageRoute(builder: (context) => MyProj());
                      Navigator.push(context, route);}, child: Text("Мои проекты")),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {Route route =
                      MaterialPageRoute(builder: (context) => Chernoviki());
                      Navigator.push(context, route);}, child: Text("Черновики")),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  child: Text("Создать новый конструктор"),
                  onPressed: () {
                    Route route =
                    MaterialPageRoute(builder: (context) => NewConst());
                    Navigator.push(context, route);
                  }),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  child: Text("Посмотреть пример"), onPressed: () {}),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  child: Text("Список конструкторов"), onPressed: () {}),
            ],
          )),
    );
    /*Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );*/
  }
}

class NewConst extends StatelessWidget {
  const NewConst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          )),
    );
  }
}

class MyProj extends StatelessWidget {
  const MyProj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Chernoviki extends StatelessWidget {
  const Chernoviki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


//18:15
