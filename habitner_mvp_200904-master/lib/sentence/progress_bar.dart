import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/constants/sizes.dart';

class MyProgressBar extends StatefulWidget {
  final int value;

  MyProgressBar({this.value});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<MyProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

    var colorTween = TweenSequence([
      /*
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.red[100]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red[100], end: Colors.red[500]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red[500], end: Colors.red),
        weight: 1,
      ),*/
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.transparent, end: Colors.transparent),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.linear));
  }

  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value / 15);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /*ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [],
              ),
              height: 10,),
        ),
      ),*/
      SizedBox(
          height: 15,
          width: MediaQuery.of(context).size.width * widget.value / 15,
          child:Image.asset("assets/bar_back.gif", fit: BoxFit.cover)),

      /*
      AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => LinearProgressIndicator(
          minHeight: 15,
          value: _curveAnimation.value,
          valueColor: _colorAnimation,
          backgroundColor: Colors.transparent,
        ),
      ),*/
/*
      AnimatedContainer(
        height: 2 * (15.0 + widget.value),
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues( widget.value * 20.0, 0, 0),
        child: Image.asset("assets/fire0.gif"),

      ),
*/
      Row(
        children: [
          Spacer(flex: 1),
              Text(
                "${widget.value}/15",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
                textAlign: TextAlign.center,
          ),
          Spacer(flex: 1),
        ],
      )
    ]);
  }
}
