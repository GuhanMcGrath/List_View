import 'package:flutter/material.dart';
import 'package:list_view/card.dart';
import 'package:list_view/data/getdata.dart';

class NormalList extends StatefulWidget {
  const NormalList({Key? key}) : super(key: key);

  @override
  _NormalListState createState() => _NormalListState();
}

class _NormalListState extends State<NormalList> {
  Future getData() async {
    var data = await GetData().getDetails();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal List"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot? snapshot) {
            if (snapshot!.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Scrollbar(
                isAlwaysShown: true,
                thickness: 8,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card1(datas: snapshot.data![index]);
                    }),
              );
            }
          }),
    );
  }
}
