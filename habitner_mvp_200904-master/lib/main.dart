import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/constants/sizes.dart';
import 'package:habitner_mvp_200904/firebase/firestore_provider.dart';
import 'package:habitner_mvp_200904/menu/menu_bar.dart';
import 'package:habitner_mvp_200904/screens/login_page_whole.dart';
import 'package:habitner_mvp_200904/sentence/calendar.dart';
import 'package:habitner_mvp_200904/sentence/sentence_screen.dart';

import 'menu/menu_gogo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String a = 's';
  bool _initialized = false;
  bool _error = false;
  FirestoreProvider _firestoreProvider = FirestoreProvider();

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void _incrementCounter() {

     _firestoreProvider.getData();
     _firestoreProvider.sendData();

    setState(() {
      _counter++;
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(size == null){
      size = MediaQuery.of(context).size;
    }

    if(_error) {
      return Text("wrong");
    }

    // Show a loader until FlutterFire is initialized

    if (!_initialized) {
      return Text("load");
    }

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Text("asdfasdf");
          }
        ),
      ),
      drawer: sideMenuBar(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(a),
                FlatButton(
                  onPressed: (){
                    _firestoreProvider.setData();
                  },
                  child: Text('setData - click !') ,),
                FlatButton(
                  onPressed: (){
                    _firestoreProvider.updateData();
                  },
                  child: Text('updateData - click !') ,),
                FlatButton(
                  onPressed: (){
                    _firestoreProvider.deleteUser();
                  },
                  child: Text('deleteData - click !') ,)
              ],
            ),
          ),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  SizedBox _drawer() {
    return SizedBox(
      width: size.width * 0.7,
      height: size.height,
      child: Stack(children: [

        Container(
          color: Colors.white,
        ),
        Column(children: [
          Stack(children: [
            Container(height: 150, color: Colors.orangeAccent),
            FlatButton(
              onPressed: () {
                print("나중에 개인페이지 이동 구현 ㄱ");
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red,
                    ),
                  ), // Image.asset() 은 안됨
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(style: const TextStyle(), children: [
                          TextSpan(
                              text: "김강현 ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: "님 환영합니다 ! ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey)),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Expanded(
              child: Column(children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                ListTile(
                    onTap: () {
                      print("나중에 홈화면 이동 구현 ㄱ");
                    },
                    leading: Icon(Icons.home),
                    title: Text('홈'),
                    trailing: Icon(Icons.arrow_forward_ios)),
                ListTile(
                    onTap: () {
                      print("나중에 작심문장 이동 구현 ㄱ");
                    },
                    leading: Icon(Icons.whatshot),
                    title: Text('작심문장'),
                    trailing: Icon(Icons.arrow_forward_ios)),
                ListTile(
                    onTap: () {
                      print("나중에 66챌린지 이동 구현 ㄱ");
                    },
                    leading: Icon(Icons.assignment_turned_in),
                    title: Text('66챌린지'),
                    trailing: Icon(Icons.arrow_forward_ios)),
                ListTile(
                    onTap: () {
                      print("나중에 공지사항 이동 구현 ㄱ");
                    },
                    leading: Icon(Icons.add_alert),
                    title: Text('공지사항'),
                    trailing: Icon(Icons.arrow_forward_ios)),
              ])),
          Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SizedBox(width: 100, child: Icon(Icons.error)),
              ))
        ]),
      ]),
    );
  }

}
