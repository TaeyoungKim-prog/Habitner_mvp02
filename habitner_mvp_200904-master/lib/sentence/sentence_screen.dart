import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitner_mvp_200904/constants/sizes.dart';
import 'package:habitner_mvp_200904/sentence/progress_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SentencePage extends StatefulWidget {
  final int year;
  final int month;
  final int day;

  const SentencePage({Key key, this.year, this.month, this.day})
      : super(key: key);

  @override
  _SentencePageState createState() => _SentencePageState();
}
String exampleText = "나는 2021년 서울대학교 전기및전자공학부에 입학한다. 그리고 기술기반 창업을 하여 지구의 여러 문제들을 해결한다. ";

bool _isOpened = false;

class _SentencePageState extends State<SentencePage> {
  PageController _pageViewController = new PageController();

  CarouselController buttonCarouselController = CarouselController();

  List<List<int>> dayContents = [];
  List<String> sentenceList = [];

  bool isAddSentence = false;

  Widget itemContents() {
    return Container(
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/sentence_back.gif",

              ),
              fit: BoxFit.cover),
          color: Colors.white,
          border: Border.all(color: Colors.orangeAccent, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "  작심문장     ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.year}-${widget.month}-${widget.day}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: _showHistory,
                  icon: Icon(
                    Icons.assignment,
                    color: (sentenceList.length == 15)
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
                Icon(
                  Icons.whatshot,
                  color: (sentenceList.length == 15) ? Colors.red : Colors.grey,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    color: (sentenceList.length == 15)
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            MyProgressBar(value: sentenceList.length),
            SizedBox(
              height: size.height * 0.65,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                      width: size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            border: Border.all(width: 0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [],
                          ),
                          child: TypewriterAnimatedTextKit(
                            repeatForever: true,
                            speed: Duration(milliseconds: 500),
                            text: [
                              exampleText
                            ],
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topCenter,
                          ),
                        ),
                      )),
                  Center(child: _animated())

                ],
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    _isOpened = true;
    super.initState();
  }

  @override
  void dispose() {
    _isOpened = false;
    super.dispose();
  }

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CarouselSlider(
          items: itemContents(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 0.7,
              initialPage: 2,
              enableInfiniteScroll: false),
        ),
      )),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: itemContents(),
          ),
        ],
      )),
    );
  }

  void _addSentence(String text) {
    if (sentenceList.length == 15) {

    }
    else{
      sentenceList.add(text);
      setState(() {});
    }
  }

  AnimatedContainer _animated() {
    return AnimatedContainer(
      height: sentenceList.length*20.0 + 50,
      width: sentenceList.length*20.0 + 50,
      duration: Duration(seconds: 1),
      child: InkWell(
          onTap:_showDialog,
          child: Image.asset('assets/fire0.gif', fit: BoxFit.cover,))
    );
  }
  _showHistory() async {
      await showDialog<String>(
        context: context,
        child: new AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
          content: SizedBox(
            height: size.height * 0.4,
            width: size.width * 0.6,
            child: ListView.builder(
                itemCount: (sentenceList.length == 0) ? 0 : 2 * sentenceList.length - 1,
                  itemBuilder: (context, index){
                  if (index%2 == 0) return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(sentenceList[(index/2).toInt()], style: TextStyle(color: Colors.grey),),
                  );
                  else return SizedBox(height:1, child: Container(color: Colors.grey,));
                  }),
            ),
        ),
      );


  }



  _showDialog() async {
    TextEditingController _showDialogController = TextEditingController();
    if (sentenceList.length != 15) {
      await showDialog<String>(
        context: context,
        child: new AlertDialog(
          backgroundColor: Colors.black54,
          contentPadding: const EdgeInsets.all(16.0),
          content: SizedBox(
            height: size.height*0.2,
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _showDialogController,
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: '작심문장', hintText: '작심문장을 적으세요'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('추가'),
                onPressed: () {
                  _addSentence(_showDialogController.text);
                  Navigator.pop(context);
                })
          ],
        ),
      );
    }
    else{
      await showDialog<String>(
        context: context,
        child: new AlertDialog(
            backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(1.0),
          content: SizedBox(
            height: size.height*0.2,
            child: Column(
              children: [
                Text("  게시하겠습니까?  ", style: TextStyle(fontSize: 20)),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/kakao.png", width: 50, height: 50,fit: BoxFit.fill,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/instagram.png", width: 50, height: 50,fit: BoxFit.fill,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/facebook.png", width: 50, height: 50,fit: BoxFit.fill,),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('공유'),
                onPressed: () {
                  _addSentence(_showDialogController.text);
                  Navigator.pop(context);
                })
          ],
        ),
      );
    }

  }

}
