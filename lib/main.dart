import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String numberbox = '';
  int answer = 0;
  int getthevalue(String op, int no, int no2) {
    int retval = 0;
    switch (op) {
      case '+':
        retval = no + no2;
        break;
      case '-':
        retval = no - no2;
        break;
      case '*':
        retval = no * no2;
        break;
      case '/':
        retval = (no / no2).floor();
        break;
      case '%':
        retval = (no * no2 / 100).floor();
    }
    return retval;
  }

  void updatevalue() {
    String op = '+';
    int no1 = 0, no2 = 0;
    for (int i = 0; i < numberbox.length; i++) {
      if (numberbox[i].compareTo('9') <= 0 &&
          numberbox[i].compareTo('0') >= 0) {
        no2 = no2 * 10 + int.parse(numberbox[i]);
      } else {
        if (op == '/' && no2 == 0) no2 = 1;
        no1 = getthevalue(op, no1, no2);
        no2 = 0;
        op = numberbox[i];
      }
    }

    answer = getthevalue(op, no1, no2);
  }

  void changetheanswer() {
    setState(() {
      updatevalue();
      numberbox = answer.toString();
      answer = 0;
    });
  }

  void add(String ch) {
    setState(() {
      numberbox += ch;
    });
  }

  void delete() {
    setState(() {
      if (numberbox.length != 0) {
        numberbox = numberbox.substring(0, numberbox.length - 1);
        updatevalue();
      }
    });
  }

  void clear() {
    setState(() {
      numberbox = '';
      answer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            margin: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    numberbox,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    onPressed: () {
                      delete();
                    },
                    onLongPress: () {
                      clear();
                    },
                    child: Icon(
                      Icons.backspace,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('7');
                    },
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('8');
                    },
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('9');
                    },
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('*');
                    },
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 30),
                    ))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('4');
                    },
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('5');
                    },
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('6');
                    },
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('/');
                    },
                    child: Text(
                      '/',
                      style: TextStyle(fontSize: 30),
                    ))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('1');
                    },
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('2');
                    },
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.grey[200]),
                    onPressed: () {
                      add('3');
                    },
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('+');
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 30),
                    ))),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('%');
                    },
                    child: Text(
                      '%',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('0');
                    },
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    shape: Border.all(color: Colors.white),
                    color: Colors.grey[200],
                    onPressed: () {
                      add('-');
                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 30),
                    ))),
            Expanded(
                child: FlatButton(
                    color: Colors.orange,
                    onPressed: () {
                      changetheanswer();
                    },
                    child: Text(
                      '=',
                      style: TextStyle(fontSize: 30),
                    ))),
          ],
        )),
      ]),
    );
  }
}

class CalcButton extends StatefulWidget {
  @override
  _CalcButtonState createState() => _CalcButtonState();
}

class _CalcButtonState extends State<CalcButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FlatButton(
            shape: Border.all(color: Colors.grey[100]),
            onPressed: () {
              // add('7');
            },
            child: Text(
              '7',
              style: TextStyle(fontSize: 30),
            )));
  }
}
