import 'package:flutter/material.dart';
import 'package:list_view/card.dart';
import 'package:list_view/data/getdata.dart';

class AnimatedLists extends StatefulWidget {
  @override
  _AnimatedListState createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimatedLists> {
  final GlobalKey<AnimatedListState> listkey = GlobalKey<AnimatedListState>();
  List items = [];
  var data = [];
  int itemcount = 1;
  Widget slide(context, index, animation, begins, ends) {
    return SlideTransition(
        position: Tween<Offset>(begin: begins, end: ends).animate(animation),
        child: items[index]);
  }

  Future getData() async {
    data = await GetData().getDetails();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated List"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, AsyncSnapshot? snapshot) {
                    if (snapshot!.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return AnimatedList(
                          initialItemCount: items.length,
                          key: listkey,
                          itemBuilder: (context, index, animation) {
                            return slide(context, index, animation,
                                Offset(0, 1), Offset.zero);
                          });
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        if (items.length < data.length) {
                          setState(() {
                            listkey.currentState!.insertItem(items.length,
                                duration: Duration(milliseconds: 400));
                            items.insert(
                                items.length,
                                Card1(
                                  datas: data[items.length],
                                ));
                          });
                        }
                      },
                      child: Text("Add Item")),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (items.length > 1) {
                          listkey.currentState!.removeItem(
                              items.length - 1,
                              (context, animation) => slide(
                                  context,
                                  items.length - 1,
                                  animation,
                                  Offset(-1, 0),
                                  Offset(0, 0)),
                              duration: Duration(milliseconds: 300));
                          items.removeAt(items.length - 1);
                        }
                      },
                      child: Text("Remove Item")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
