import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'colors_ui.dart' as color_ui;

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Row(),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("img/990130.jpg"),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white70,
                            child: Icon(CupertinoIcons.camera),
                          ),
                        ),
                      ]))
                ],
              ),
            ),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
