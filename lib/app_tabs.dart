import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppTab extends StatelessWidget {
  final Color color;
  final String text;
  const AppTab({key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 50,
      child: Text(this.text,
          style:
              TextStyle(color: Color.fromARGB(255, 49, 47, 47), fontSize: 18)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: Offset(0, 0),
            )
          ]),
    );
  }
}
