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

class _MyHomePageState extends State<MyHomePage> {
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
            Container(
                child: Stack(children: [
              Positioned(
                child: Container(
                  height: 180,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage('img/990130.jpg'),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ]))
          ],
        ),
      )),
    );
  }
}
