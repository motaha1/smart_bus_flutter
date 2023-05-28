import 'package:bus/core/app_export.dart';
import 'package:bus/models/info.dart';
import 'package:bus/presentation/locations/location.dart';
import 'package:bus/presentation/travels/travels.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  //final _advancedDrawerController = AdvancedDrawerController();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Consumer<AuthProvider>(builder: (context, provider, x) {
            return Column(
              children: [
                // TopBarFb2(title: 'Welcome back,',upperTitle: "Jefferson",) ,

                TopBarFb4(
                  title: 'Welcome back',
                  upperTitle: provider.user?.name ?? 'mohammad taha',
                  onTapMenu: () {
                    _handleMenuButtonPressed();
                  },
                ),

                SizedBox(
                  height: 60,
                ),

                CreditCard(
                    onTopRightButtonClicked: () {},
                    cardIcon: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/mastercard.png?alt=media&token=1ae51e14-5a60-4dbf-8a42-47cb9c3c1dfe",
                        width: 50),
                    user: provider.user),
              ],
            );
          }),
        ),
      ),

      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Consumer<AuthProvider>(builder: (context, provider, x) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://www.getillustrations.com/packs/3d-avatar-illustrations/male/_1x/Avatar,%203D%20_%20man,%20male,%20people,%20person,%20shirt,%20hairstyle_md.png',
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(patientScreen());
                    },
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('My Profile'),
                  ),
                  ListTile(
                    onTap: () async {
                      EasyLoading.show(status: "loading") ; 

                    await provider.alltrav() ; 

EasyLoading.dismiss() ; 

                      Get.to(Travels())  ; 
                      // print('fffff');
                      // provider.date_patient =
                      //     DateTime.now().toString().split(" ")[0];
                      // EasyLoading.show(status: 'loading....');
                      // await provider.view_appoiment_for_patient('');
                      // EasyLoading.dismiss();
                      // Get.to(PatientSchedule());
                    },
                    leading: Icon(Icons.bus_alert),
                    title: Text('my travels'),
                  ),

                            ListTile(
                    onTap: () async{
                      EasyLoading.show(status: "loading") ; 
                    await provider.cap_info_prov() ; 
                    //  
                      // Get.put(PrivacyPolicyController());
EasyLoading.dismiss() ; 
                       Get.to(Location());
                    },
                    leading: Icon(Icons.gps_fixed),
                    title: Text('Bus locations'),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.put(PrivacyPolicyController());

                      // Get.to(PrivacyPolicyScreen());
                    },
                    leading: Icon(Icons.privacy_tip_outlined),
                    title: Text('Privacy & Policy'),
                  ),

                  // ListTile(
                  //   onTap: () {
                  //     // Get.put(HelpCenterController());
                  //     // Get.to(HelpCenterScreen());
                  //   },
                  //   leading: Icon(Icons.help_center),
                  //   title: Text('Help Center'),
                  // ),
                  ListTile(
                    onTap: () {
                      // Get.to(SettingsScreen());
                    },
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                  // ListTile(
                  //   onTap: () {
                  //     // Get.to(chat_bot());
                  //   },
                  //   leading: Icon(Icons.android),
                  //   title: Text('Chat bot'),
                  // ),
                  // ListTile(
                  //   onTap: () async {
                  //     EasyLoading.show(status: 'loading....');

                  //     // await provider.how_i_am_talk_api();
                  //     // EasyLoading.dismiss();

                  //     // // Get.to(ThreeScreen_new('1'));
                  //     // Get.to(ChatPage());
                  //   },
                  //   leading: Icon(Icons.chat_rounded),
                  //   title: Text('chat'),
                  // ),
                  ListTile(
                    onTap: () {
                      Get.defaultDialog(title:'logout' , middleText: 'are you sure to logout ?'  ,textCancel: 'cancel' , onCancel: () {

                      },
                      textConfirm: 'yes' ,
                      onConfirm: () {
                     //   Get.to(MyWidgetLogin());
                      },
                      );
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Logout', style: TextStyle(color: Colors.red)),
                  ),
                  Spacer(),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Text('Terms of Service | Privacy Policy'),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

String addSpaces(String str) {
  // Check if the input string has an even length
  if (str.length % 2 == 0) {
    // Split the string into pairs of characters using a regular expression
    Iterable<Match> matches = RegExp('.{1,2}').allMatches(str);
    // Map each pair to a new string with a space in between
    List<String?> pairs = matches.map((match) => match.group(0)).toList();
    // Join the pairs of characters with a space in between
    String result = pairs.join(' ');
    return result;
  } else {
    // If the string has an odd length, throw an exception
    throw Exception('Input string must have an even length');
  }
}

//- - - - - - - - - Instructions - - - - - - - - - - - - - - - - - -
//
// Default Widget call (instantiation):
//  - CreditCard(onTopRightButtonClicked: () {}, cardIcon: Image.network("https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/mastercard.png?alt=media&token=1ae51e14-5a60-4dbf-8a42-47cb9c3c1dfe",  width: 50,))
//
// Coming Soon:
//  - integration into a a card stack
//
//- - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -

class CreditCard extends StatelessWidget {
  final String balance;
  final String cardNumber;
  final Function onTopRightButtonClicked;
  final Gradient backgroundGradient;
  final info user;
  final Widget
      cardIcon; //Should be an Image.network(...) or Image.asset(...) Widget

  const CreditCard({
    Key? key,
    required this.user,
    required this.onTopRightButtonClicked,
    required this.cardIcon,
    this.balance = "\₪2,850.00",
    this.cardNumber = "****  ****  ****  3799",
    this.backgroundGradient =
        const LinearGradient(colors: [Colors.black87, Colors.black54]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: backgroundGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            offset: Offset(0, 15),
            blurRadius: 45,
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Consumer<AuthProvider>(builder: (context, provider, x) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () async {
                    // onTopRightButtonClicked();
                    EasyLoading.show(status: "loading");
                    await provider.getinfo();
                    EasyLoading.dismiss();
                  },
                ),
              );
            }),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      addSpaces(user.card ?? '0000'),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/mastercard.png?alt=media&token=1ae51e14-5a60-4dbf-8a42-47cb9c3c1dfe",
                      width: 50,
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\₪${user.funds} ",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Balance",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopBarFb4 extends StatelessWidget {
  final String title;
  final String upperTitle;
  final Function() onTapMenu;
  const TopBarFb4(
      {required this.title,
      required this.upperTitle,
      required this.onTapMenu,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onTapMenu,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              Text(upperTitle,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
