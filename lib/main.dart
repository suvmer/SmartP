//АМОГУС

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

//who = 0 - никакой подсветки
//who = 1 - подсветка "Мои проекты"
//= 2 - подсветка "Черновики"
Container getHeader(context, [who]) {
  who = who ?? 0;
  return Container(
      margin: new EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                if(who != 1) {
                  Route route = MaterialPageRoute(
                      builder: (context) => MyProj());
                  Navigator.push(context, route);
                }
              },
              child: Text("Мои проекты",
                  style: who == 1
                      ? TextStyle(fontSize: 20, color: Colors.redAccent)
                      : TextStyle(fontSize: 20))),
          SizedBox(width: 10),
          TextButton(
            onPressed: () {
              if(who != 2) {
                Route route =
                MaterialPageRoute(builder: (context) => Chernoviki());
                Navigator.push(context, route);
              }
            },
            child: Text("Черновики",
                style: who == 2
                    ? TextStyle(fontSize: 20, color: Colors.redAccent)
                    : TextStyle(fontSize: 20)),
          ),
        ],
      ));
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
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

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
          getHeader(context),
          SizedBox(
            height: 40,
          ),
          Image.asset("Materials/pazl2.png"),
          SizedBox.fromSize(
            size: Size(130, 50), // button width and height
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Material(
                color: Colors.blue, // button color
                child: InkWell(
                  splashColor: Colors.green, // splash color
                  onTap: () {}, // button pressed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Сканировать",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.qr_code_scanner), // icon
                      // text
                    ],
                  ),
                ),
              ),
            ),
          )
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

class NewConst extends StatefulWidget {
  const NewConst({Key? key}) : super(key: key);

  @override
  State<NewConst> createState() => _NewConstState();
}

class _NewConstState extends State<NewConst> {
  List toDoList = [
    "1. Умный вентилятор",
    "2. Умный свет",
    "3. Автоматическое проветривание",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Выбирите уровень",
              style: TextStyle(color: Colors.grey.shade800),
            ),
            backgroundColor: Colors.grey.shade300),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(toDoList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(toDoList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (context) => Choice());
                        Navigator.push(context, route);
                      },
                      icon: Icon(
                        Icons.not_started_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  //if (direction (направление) == DismissDirection.endToStart)
                  setState(() {
                    toDoList.removeAt(index);
                  });
                },
              );
            }),
      ),
    );
  }
}

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  List blocks = [
    "Получение данных с датчика",
    "Вкл. вентилятор",
    "Выкл. вентилятор",
    "Если температура больше 30",
    "Если температура меньше 30",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: Text(
                "Выбирите блок",
                style: TextStyle(color: Colors.grey.shade800),
              ),
              backgroundColor: Colors.grey.shade300),
          body: Column(
            children: [
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: blocks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(blocks[index]),
                        child: Card(
                          child: ListTile(
                            title: Text(blocks[index]),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  blocks.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.add_box,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        onDismissed: (direction) {},
                      );
                    }),
              ),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox.fromSize(
                          size: Size(120, 60), // button width and height
                          child: ElevatedButton(
                            child: Text("Завершить"),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => Scheme());
                              Navigator.push(context, route);
                            },
                          )))),
              SizedBox(
                height: 25,
              )
            ],
          )),
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    if(index == 0) {
      Route route = MaterialPageRoute(
          builder: (context) => MyApp());
      Navigator.push(context, route);
    }
    if(index == 1) {
      Route route = MaterialPageRoute(
          builder: (context) => NewConst());
      Navigator.push(context, route);
    }
    if(index == 2) {
      Route route = MaterialPageRoute(
          builder: (context) => ProfilePage(light: 2));
      Navigator.push(context, route);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.not_started_sharp),
            backgroundColor: Colors.blue,
            label: 'Уровни',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      );
  }
}

class MyProj extends StatelessWidget {
  MyProj({Key? key}) : super(key: key);
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    log(index);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          getHeader(context, 1),
          Expanded(
              child: SizedBox(
                  height: 700.0,
                  child: GridView.count(
                      padding: EdgeInsets.all(40.0),
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 40.0,
                      crossAxisSpacing: 40.0,
                      children: [
                        GridTile(
                            child: Container(
                                color: UniqueColorGenerator.getColor(),
                                child: Padding(padding: EdgeInsets.all(70.0)))),
                        GridTile(child: new FlutterLogo()),
                        GridTile(
                            child: Container(
                                color: UniqueColorGenerator.getColor(),
                                child: Padding(padding: EdgeInsets.all(70.0)))),
                        GridTile(
                            child: Container(
                                color: UniqueColorGenerator.getColor(),
                                child: Padding(padding: EdgeInsets.all(70.0)))),
                        GridTile(child: new FlutterLogo()),
                        GridTile(
                            child: Container(
                                color: UniqueColorGenerator.getColor(),
                                child: Padding(padding: EdgeInsets.all(70.0)))),
                        GridTile(child: new FlutterLogo()),
                        GridTile(
                            child: Container(
                                color: UniqueColorGenerator.getColor(),
                                child: Padding(padding: EdgeInsets.all(70.0)))),
                        GridTile(child: new FlutterLogo())
                      ]))),
          /*Expanded(
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
                                Route route = MaterialPageRoute(
                                    builder: (context) => MyApp());
                                Navigator.push(context, route);
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
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => NewConst());
                                Navigator.push(context, route);
                              },
                              icon: Icon(
                                Icons.not_started_sharp,
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
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => ProfilePage());
                                Navigator.push(context, route);
                              }, // button pressed
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
                  ))),*/
        ],
      ),
      bottomNavigationBar: Footer(),
      ),

    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({int light = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getHeader(context),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(140),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage("Materials/img.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Иван Смирнов  ",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Text("13 лет", style: TextStyle(fontSize: 20)),
                      ]
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Москва", style: TextStyle(fontSize: 20)),
                  ]
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Почта: ", style: TextStyle(fontSize: 20)),
                    Text("noin45@mail.ru", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ]
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: FaIcon(Icons.delete),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "Удалить аккаунт",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
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
          getHeader(context, 2),
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
                                Route route = MaterialPageRoute(
                                    builder: (context) => MyApp());
                                Navigator.push(context, route);
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
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => NewConst());
                                Navigator.push(context, route);
                              },
                              icon: Icon(
                                Icons.not_started_sharp,
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

class Scheme extends StatelessWidget {
  const Scheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.grey.shade300,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Image.asset(
                'Materials/shema.png',
                height: 480,
              ),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: SizedBox.fromSize(
                          size: Size(120, 56), // button width and height
                          child: ElevatedButton(
                            child: Text("Завершить"),
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => GoodEnd());
                              Navigator.push(context, route);
                            },
                          )))),
              SizedBox(
                height: 15,
              )
            ],
          )),
    );
  }
}

class GoodEnd extends StatelessWidget {
  const GoodEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('Materials/home.png', height: 350),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Работает", style: TextStyle(fontSize: 40)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Код", style: TextStyle(fontSize: 40)),
                              backgroundColor: Colors.white70,
                              content: Image.asset('Materials/Code.png',
                                  height: 500),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(22.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.arrow_back, size: 25),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    child: Text("Подробнее", style: TextStyle(fontSize: 25))),
              ],
            ),
            ElevatedButton(
                onPressed: () {}, child: Text("Добавить в мои проекты", style: TextStyle(fontSize: 25))),
          ],
        ),
      ),
    ));
  }
}

class BadEnd extends StatelessWidget {
  const BadEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//8:12
