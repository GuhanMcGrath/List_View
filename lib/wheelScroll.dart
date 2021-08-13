import 'package:flutter/material.dart';
import 'package:list_view/card.dart';
import 'package:list_view/data/getdata.dart';

class WheelScroll extends StatefulWidget {
  const WheelScroll({Key? key}) : super(key: key);

  @override
  _WheelScrollState createState() => _WheelScrollState();
}

class _WheelScrollState extends State<WheelScroll> {
  Future getData() async {
    var data = await GetData().getDetails();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wheel Scroll View"),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot? snapshot) {
                if (snapshot!.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListWheelScrollView(
                      itemExtent: 410,
                      children: List.generate(snapshot.data.length,
                          (index) => Card1(datas: snapshot.data[index])));
                }
              })),
    );
  }
}
