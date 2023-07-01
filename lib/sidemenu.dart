import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'home_page.dart';
import 'package:lottie/lottie.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}
//try scaffold

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 240,
        color: Color.fromARGB(255, 6, 35, 58),
        height: double.infinity,
        child: SafeArea(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://i.ibb.co/9VsQ3q2/990130.jpg"),
              ),
              accountName: Text("Rishi Jain"),
              accountEmail: Text("rishijain2607@gmail.com"),
              decoration: BoxDecoration(color: Color.fromARGB(255, 6, 35, 58)),
            ),
            ListTile(
              leading: SizedBox(
                height: 45,
                width: 100,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    }));
                  },
                  icon: Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
