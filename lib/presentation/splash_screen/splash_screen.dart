import 'package:bus/dio_helper/dio.dart';
import 'package:bus/presentation/anas/model.dart';
import 'package:bus/presentation/anas/test_screen.dart';
import 'package:bus/presentation/home/home.dart';
import 'package:bus/presentation/test.dart';
import 'package:bus/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'controller/splash_controller.dart';
import 'package:bus/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(
                0.5,
                0,
              ),
              end: Alignment(
                0.5,
                1,
              ),
              colors: [
                ColorConstant.blueGray700,
                ColorConstant.blueGray900,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              top: 41,
              bottom: 41,
            ),
            child: Consumer<AuthProvider>(
              builder: (context , provider , x) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()async {
await provider.getinfo() ; 


                    Get.to(Home());
                      },
                      child: CustomImageView(
                        svgPath: ImageConstant.imgFrame,
                        height: getVerticalSize(
                          132,
                        ),
                        width: getHorizontalSize(
                          263,
                        ),
                        margin: getMargin(
                          top: 239,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          top: 7,
                        ),
                        child: SizedBox(
                          width: getHorizontalSize(
                            242,
                          ),
                          child: Divider(
                            height: getVerticalSize(
                              2,
                            ),
                            thickness: getVerticalSize(
                              2,
                            ),
                            color: ColorConstant.whiteA700,
                            indent: getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        90,
                      ),
                      width: getHorizontalSize(
                        150,
                      ),
                      margin: getMargin(
                        top: 10,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "msg_take_it_easy".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold2128,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 27,
                              ),
                              child: Text(
                                "lbl_tickets".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterBold2128,
                              ),
                            ),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgVector11,
                            height: getVerticalSize(
                              59,
                            ),
                            width: getHorizontalSize(
                              137,
                            ),
                            alignment: Alignment.topLeft,
                            margin: getMargin(
                              top: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      svgPath: ImageConstant.imgMusic,
                      height: getVerticalSize(
                        17,
                      ),
                      width: getHorizontalSize(
                        63,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
