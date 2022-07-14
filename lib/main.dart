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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => MyProj());
                    Navigator.push(context, route);
                  },
                  child: Text("Мои проекты", style: TextStyle(fontSize: 20))),
              SizedBox(width: 10),
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Chernoviki());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Черновики",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Image.asset("Materials/pazl2.png")
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
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => MyProj());
                    Navigator.push(context, route);
                  },
                  child: Text("Мои проекты",
                      style: TextStyle(fontSize: 20, color: Colors.green))),
              SizedBox(width: 10),
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Chernoviki());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Черновики",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox.fromSize(
                        size: Size(70, 70), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.blue, // splash color
                              onTap: () {
                                Navigator.pop(context);
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.home_outlined), // icon
                                  Text("Главная"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                          size: Size(70, 70),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                size: 50,
                                color: Colors.blue,
                              ))),
                      SizedBox.fromSize(
                        size: Size(70, 70), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.blue, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.account_circle), // icon
                                  Text("Профиль"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      )),
    );
  }
}

class Chernoviki extends StatelessWidget {
  const Chernoviki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => MyProj());
                    Navigator.push(context, route);
                  },
                  child: Text("Мои проекты", style: TextStyle(fontSize: 20))),
              SizedBox(width: 10),
              TextButton(
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => Chernoviki());
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "Черновики",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox.fromSize(
                        size: Size(70, 70), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.blue, // splash color
                              onTap: () {
                                Navigator.pop(context);
                              }, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.home_outlined), // icon
                                  Text("Главная"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox.fromSize(
                          size: Size(70, 70),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_circle,
                                size: 50,
                                color: Colors.blue,
                              ))),
                      SizedBox.fromSize(
                        size: Size(70, 70), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.blue, // splash color
                              onTap: () {}, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.account_circle), // icon
                                  Text("Профиль"), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
        ],
      )),
    );
  }
}

//22:22
