import 'package:bus/core/app_export.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:bus/dio_helper/dio.dart';
import 'package:provider/provider.dart';

import '../map/map.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            SizedBox(
              child: FadeAppBarTutorial(),
              height: 70,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: PromoCard(),
              onTap: () async {
                EasyLoading.show(
                    status: 'loading responce from gps firebase realtime');
                await DioHelper.diohelper.realtime();
                EasyLoading.dismiss();
                Get.to(MapScreen());
              },
            ),
            // Text(provider.cap?.travel?.name ?? 'jj'),
          ],
        );
      }),


            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back() ; 
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_right_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FadeAppBarTutorial extends StatefulWidget {
  const FadeAppBarTutorial({Key? key}) : super(key: key);

  @override
  State<FadeAppBarTutorial> createState() => _FadeAppBarTutorialState();
}

class _FadeAppBarTutorialState extends State<FadeAppBarTutorial> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff123456),
        body: Container(
          // Place as the child widget of a scaffold
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fdave-hoefler-PEkfSAxeplg-unsplash.jpg?alt=media&token=8b7e1d44-a52f-49f9-a3ae-e542cca0f368"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: Center(
                        child: Text(
                      "🚀",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.bold),
                    )),
                  ))
                ],
              ),
              PreferredSize(
                  child: FadeAppBar(scrollOffset: _scrollControllerOffset),
                  preferredSize: Size(MediaQuery.of(context).size.width, 20.0))
            ],
          ), // Place child here
        ));
  }
}

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  const FadeAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 24.0,
          ),
          color: Colors.white
              .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
          child: SafeArea(child: SearchInput()),
        ));
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            // prefixIcon: Icon(Icons.email),
            prefixIcon: Icon(Icons.search, size: 20, color: Color(0xffFF5A60)),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Where are you going?',
            hintStyle: TextStyle(color: Colors.black.withOpacity(.75)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onChanged: (value) {},
        ));
  }
}

class PromoCard extends StatelessWidget {
  PromoCard({Key? key}) : super(key: key);
  String xd = 'hello';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff53E88B), Color(0xff15BE77)])),
        child: Stack(
          children: [
            // Opacity(
            //   opacity: .5,
            //   child: Image.network(
            //       "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
            //       fit: BoxFit.cover),
            // ),
            SizedBox(
              height: 150,
              width: 220,
              child: Image.network(
                  "https://static.vecteezy.com/system/resources/previews/009/342/488/non_2x/bus-clipart-design-illustration-free-png.png"),
            ),
            Consumer<AuthProvider>(builder: (context, provider, x) {
              return  Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text("Bus 1 \n${provider.x}\n${provider?.cap?.name ??'nassr khaled'}" , 
                       
                style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}







