import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget_test extends StatelessWidget {
  const MyWidget_test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("taha"),),
      body: Column(
        children: [
          Text("data")
        ],
      ) ,
    );
  }
}