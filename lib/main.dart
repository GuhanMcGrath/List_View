import 'package:flutter/material.dart';
import 'package:list_view/animatedlist.dart';
import 'package:list_view/list.dart';
import 'package:list_view/reorderable.dart';
import 'package:list_view/wheelScroll.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}

class ListButtons extends StatefulWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  _ListButtonsState createState() => _ListButtonsState();
}

class _ListButtonsState extends State<ListButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListButtons"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                title: "Normal List",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NormalList()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Reordorable List",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReorderableLists()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Animated List",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnimatedLists()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "WheelScroll List",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WheelScroll()));
                }),
          ],
        ),
      )),
    );
  }
}

class Container extends StatelessWidget {
  String? title;
  Function? onTap;
  Container({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        height: 80,
        child: ElevatedButton(
            onPressed: () {
              onTap!();
            },
            child: Text(
              title!,
              style: TextStyle(fontSize: 25),
            )));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ListButtons()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage("assets/ic_launcher.png"),
        ),
      ),
    );
  }
}
