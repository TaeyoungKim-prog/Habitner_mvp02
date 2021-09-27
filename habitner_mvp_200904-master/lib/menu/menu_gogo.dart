import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/constants/sizes.dart';

Widget sideMenuBar() {
  return SafeArea(child: SizedBox(
    width: size.width * 0.7,
    height: size.height,
    child: Stack(children: [

      Container(
        color: Colors.white,
      ),
      Column(children: [
        Stack(children: [
          Container(height: 160, color: Colors.orangeAccent),
          Center(
            child: FlatButton(
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
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
                ],
              ),
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
                    print("나중에 체크리스트 이동 구현 ㄱ");
                  },
                  leading: Icon(Icons.assignment_turned_in),
                  title: Text('체크리스트'),
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
  ));
}