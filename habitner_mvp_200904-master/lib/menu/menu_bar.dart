import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/constants/sizes.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> with SingleTickerProviderStateMixin {


  int _duration = 200;
  AnimationController _animationController;

  bool _isOpened = false;
  double menuWidth = size.width * 0.7;

  @override
  void initState() {
    // with SingleTickerProviderStateMixin  needs
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: _duration));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [_sideMenu(), _topMenu(),],
      );
  }

  Column _topMenu() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  _isOpened? _animationController.reverse(): _animationController.forward();
                  setState(() {
                    _isOpened = !_isOpened;
                  });
                },
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: _animationController
                )),
            Expanded(child: Container())
          ],
        ),
        Expanded(child: Container())
      ],
    );
  }

  Widget _sideMenu() {
    return Stack(
      children: [_menuBackGround(), Drawer(child: _sideMenuAnimate()),],
    );
  }

  Widget _menuBackGround() {
    return Visibility(
      visible: _isOpened,
      child: Container(
        height: size.height,
        width: size.width,
        color: Colors.black54,
      ),
    );
  }

  Widget _sideMenuAnimate() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: _duration),
      transform: Matrix4.translationValues(_isOpened? 0 : -menuWidth , 0 , 0),
      child: _sideMenuContents(),);
  }

  Widget _sideMenuContents() {
    return 
        SizedBox(
          width: menuWidth,
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
                    print("????????? ??????????????? ?????? ?????? ???");
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                        ),
                      ), // Image.asset() ??? ??????
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(style: const TextStyle(), children: [
                            TextSpan(
                                text: "????????? ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: "??? ??????????????? ! ",
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
                          print("????????? ????????? ?????? ?????? ???");
                        },
                        leading: Icon(Icons.home),
                        title: Text('???'),
                        trailing: Icon(Icons.arrow_forward_ios)),
                    ListTile(
                        onTap: () {
                          print("????????? ???????????? ?????? ?????? ???");
                        },
                        leading: Icon(Icons.whatshot),
                        title: Text('????????????'),
                        trailing: Icon(Icons.arrow_forward_ios)),
                    ListTile(
                        onTap: () {
                          print("????????? ??????????????? ?????? ?????? ???");
                        },
                        leading: Icon(Icons.assignment_turned_in),
                        title: Text('???????????????'),
                        trailing: Icon(Icons.arrow_forward_ios)),
                    ListTile(
                        onTap: () {
                          print("????????? ???????????? ?????? ?????? ???");
                        },
                        leading: Icon(Icons.add_alert),
                        title: Text('????????????'),
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
