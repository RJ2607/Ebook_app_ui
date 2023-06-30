import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'colors_ui.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late List books;

  late ScrollController _scrollController;
  late TabController _tabController;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("Json/book_lit.json")
        .then((s) => {
              setState(() {
                books = json.decode(s);
              })
            });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();

    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.square_split_2x2_fill, size: 30),
                  Row(
                    children: [
                      Icon(CupertinoIcons.search, size: 25),
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.bell_solid, size: 25)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Popular books",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
                height: 180,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: -25,
                    right: 0,
                    child: Container(
                      height: 180,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: books == null ? 0 : books.length,
                          itemBuilder: (_, i) {
                            return Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(books[i]["img"]),
                                    fit: BoxFit.fill),
                              ),
                            );
                          }),
                    ),
                  )
                ])),
            Expanded(
                child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (BuildContext context, bool isScroll) {
                return [
                  SliverAppBar(
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        child: TabBar(
                          indicatorPadding: const EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: const EdgeInsets.all(0),
                          controller: _tabController,
                          isScrollable: true,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          tabs: [
                            Container(
                              width: 120,
                              height: 50,
                              child: Text("New",
                                  style: TextStyle(color: Colors.white)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ]),
                            ),
                            Container(
                              width: 120,
                              height: 50,
                              child: Text("New",
                                  style: TextStyle(color: Colors.white)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ]),
                            ),
                            Container(
                              width: 120,
                              height: 50,
                              child: Text("New",
                                  style: TextStyle(color: Colors.white)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(controller: _tabController, children: [
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("content"),
                  ),
                ),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("content"),
                  ),
                ),
                Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                    title: Text("content"),
                  ),
                ),
              ]),
            )),
          ],
        ),
      )),
    );
  }
}
