import 'package:bus/presentation/anas/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Componet extends StatelessWidget {
  //const Componet({Key? key}) : super(key: key );
  Data? x;
  Componet(this.x);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(x?.title.toString() ?? 'hello'),
          Text(x?.description.toString() ?? 'hello'),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
