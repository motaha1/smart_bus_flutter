import 'package:bus/core/app_export.dart';
import 'package:bus/models/travels.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class Travels extends StatelessWidget {
  const Travels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),


Consumer<AuthProvider>(
  builder: (context , provider, x) {
    return     Expanded(
    
    
    
    
    
    
    
        
    
                                                      child: provider.taha == null
    
        
    
                                                          ? Text('nothing ')
    
        
    
                                                          : ListView.builder(
    
        
    
                                                        shrinkWrap: true,
    
    
    
        
    
                                                            //  scrollDirection: Axis.horizontal,
    
        
    
                                                            //  physics: BouncingScrollPhysics(),
    
        
    
                                                              itemCount:
    
        
    
                                                                  provider.taha!.length,
    
        
    
                                                              // itemBuilder: (context,index) => cat_doctor();
    
        
    
                                                              itemBuilder: (context, index) {
    
        
    
                                                                return CardFb2(provider.taha![index]);
    
        
    
                                                              },
    
        
    
                                                            ),
    
        
    
                                                    );
  }
)

          // CardFb2(
          //   text: "Explore",
          //   imageUrl:
          //       "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
          //   subtitle: "+30 books",
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}

class CardFb2 extends StatelessWidget {
   String? text;
   String imageUrl = "https://cdn-icons-png.flaticon.com/512/3774/3774090.png";
   String? subtitle;
   

  PassTravel? x ; 

CardFb2(this.x) ; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Row(
          children: [
            Image.network(imageUrl, height: 59, fit: BoxFit.cover),
            const SizedBox(
              width: 15,
            ),
            Text(x!.travel?.name ??'balad-najah',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Spacer(),
            Text(
              x!.date ??'6/1/2023',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
           
          ],

          
        ),
      ),
    
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "This is\nYour Travels",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Get.back(); 
            },
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.25)),
              ]),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.icecream,
                  size: 25,
                  color: Color(0xff53E88B),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
