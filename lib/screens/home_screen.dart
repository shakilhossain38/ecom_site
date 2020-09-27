import 'package:ecom_site/models/choices.dart';
import 'package:flutter/material.dart';
import 'package:ecom_site/models/choiceData.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: choiceData.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 40.0,
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.dehaze), onPressed: () {}),
                SizedBox(
                  width: 50.0,
                ),
                Text(
                  "FastFoodie",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(232, 232, 232, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Search Restaurant',
                suffixIcon: Icon(Icons.graphic_eq),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Divider(),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20),
            child: DefaultTabController(
              length: choiceData.length,
              child: Scaffold(
                appBar: AppBar(
                    elevation: 0.5,
                    backgroundColor: Colors.white,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.0),
                      child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black87,
                          indicatorColor: Colors.red,
                          isScrollable: true,
                          tabs: choiceData
                              .map<Widget>((Choices choices) => Tab(
                                    text: choices.title,
                                  ))
                              .toList()),
                    )),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
