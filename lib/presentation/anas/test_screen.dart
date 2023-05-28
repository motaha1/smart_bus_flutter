import 'package:bus/presentation/anas/component.dart';
import 'package:bus/dio_helper/dio.dart';
import 'package:bus/presentation/anas/model.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  //const MyWidget({Key? key}) : super(key: key);
  MyWidget() {

  }

  @override
  Widget build(BuildContext context)  {

    return Scaffold(
body:  Container(

child:


     Column(
       children: [
         Consumer<AuthProvider>(
           builder: (context , provider ,x) {
             return Expanded(



    
                                                  child: provider.all == null
    
                                                      ? Text('nothing ')
    
                                                      : ListView.builder(
    
                                                    shrinkWrap: true,

    
                                                        //  scrollDirection: Axis.horizontal,
    
                                                        //  physics: BouncingScrollPhysics(),
    
                                                          itemCount:
    
                                                              provider.all!.length,
    
                                                          // itemBuilder: (context,index) => cat_doctor();
    
                                                          itemBuilder: (context, index) {
    
                                                            return Componet(provider
    
                                                                .all![index]);
    
                                                          },
    
                                                        ),
    
                                                );
           }
         ),
       ],
     )


)
,

    );
  }
}