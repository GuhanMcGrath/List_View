import 'package:flutter/material.dart';
import 'package:list_view/card.dart';
import 'package:list_view/data/getdata.dart';

class ReorderableLists extends StatefulWidget {
  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableLists> {
  var data;
  List<Widget> reorderableList = [];
  Future getData() async {
    if (data == null) {
      data = await GetData().getDetails();
      data.forEach((element) {
        Card1 card = Card1(datas: element);
        reorderableList.add(Container(
          key: Key("${reorderableList.length}"),
          child: card,
        ));
      });
      reorderableList.toSet();
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reorderable"),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot? snapshot) {
              if (snapshot!.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ReorderableListView(
                  children: reorderableList,
                  onReorder: (int oldindex, int newindex) {
                    setState(() {
                      if (oldindex < newindex) {
                        newindex -= 1;
                      }
                      final item = reorderableList.removeAt(oldindex);
                      reorderableList.insert(newindex, item);
                    });
                  },
                );
              }
            }),
      ),
    );
  }
}
