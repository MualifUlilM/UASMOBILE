import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uas/helper/dbhelper.dart';
import 'package:uas/model/data.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  DBHelper dbHelper = DBHelper();
  List<Data> listDatas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: RefreshIndicator(
          onRefresh: () async {
            getData();
          },
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top * 2),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'CRUD Apps',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Pull To Refresh',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listDatas.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: ListTile(
                          leading: Image.file(File(listDatas[i].image_path)),
                          title: Text(listDatas[i].name,
                              style: Theme.of(context).textTheme.headline2),
                          subtitle: Text(
                            "${listDatas[i].age} Years Old",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.more_horiz,
                                  color: Theme.of(context).buttonColor),
                              onPressed: () => Navigator.pushNamed(
                                  context, '/detail',
                                  arguments: listDatas[i])),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void getData() {
    setState(() {
      listDatas.clear();
    });
    dbHelper.select().then((value) {
      for (var item in value) {
        setState(() {
          listDatas.add(Data.fromJson(item));
        });
      }
    });
  }
}
