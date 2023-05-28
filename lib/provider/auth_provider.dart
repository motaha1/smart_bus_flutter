import 'package:bus/dio_helper/dio.dart';
import 'package:bus/models/cap_info.dart';
import 'package:bus/models/info.dart';
import 'package:bus/models/travels.dart';
import 'package:bus/presentation/anas/model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  List<Data>? all;

  getall() async {
    all = await DioHelper.diohelper.getall();
    notifyListeners();

    // fruits.sort((a, b) => getPrice(a).compareTo(getPrice(b)));
  }

  info user = new info();

  getinfo() async {
    user = await DioHelper.diohelper.infoo();
    notifyListeners();

    // fruits.sort((a, b) => getPrice(a).compareTo(getPrice(b)));
  }

  captine? cap = new captine();
  String x = "balad-najah";

  cap_info_prov() async {
    cap = await DioHelper.diohelper.cap_info();
    notifyListeners();
    x = cap?.travel?.name ?? 'balad-najah';
    print(cap?.travel?.name ?? 'taha');

    // fruits.sort((a, b) => getPrice(a).compareTo(getPrice(b)));
  }

  List<PassTravel>? taha; 

   alltrav() async {
    taha = await DioHelper.diohelper.alltravel();
    notifyListeners();


    taha!.sort((a, b) => (a!.id ??0).compareTo(-(b!.id ??0)));
  }
}
