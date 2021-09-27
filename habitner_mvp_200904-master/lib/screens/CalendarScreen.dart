import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/screens/chat_list.dart';
import 'package:habitner_mvp_200904/screens/chatting_room_screen.dart';
import 'package:habitner_mvp_200904/sentence/calendar.dart';
import 'package:habitner_mvp_200904/sentence/sentence_screen.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Calendar(),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SentencePage(year: 2020, month:9, day: 12)));
            },
              child: Text("작심문장으로")),
          FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatList()));
          },child: Text("채팅리스트로"))
        ],
      ),
    );
  }
}
