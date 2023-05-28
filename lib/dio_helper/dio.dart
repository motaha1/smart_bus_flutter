import 'dart:developer';

import 'package:bus/models/cap_info.dart';
import 'package:bus/models/info.dart';
import 'package:bus/models/travels.dart';
import 'package:bus/presentation/anas/model.dart';
import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();
  static DioHelper diohelper = DioHelper._();

  Dio dio = Dio();

  Future<List<Data>> getall() async {
    Response responce = await dio.get('https://fakestoreapi.com/products');
    //Specialists specialists = Specialists.fromJson(responce.data);
    // print(responce.data.toString());
    log(responce.data.toString());

    List<Data> test = responce.data.map<Data>((e) {
      return Data.fromJson(e);
    }).toList();

    return test;
  }

  Future<info> infoo() async {
    Response responce = await dio
        .post('https://motaha2001.pythonanywhere.com/api/info', data: {'id': '214ece1e'});
    //Specialists specialists = Specialists.fromJson(responce.data);
    // print(responce.data.toString());
    log(responce.data.toString());

    info test = info.fromJson(responce.data); 

    return test;
  }
    realtime() async {
    Response responce = await dio
        .post('http://motaha2001.pythonanywhere.com/api/firebase');
    //Specialists specialists = Specialists.fromJson(responce.data);
    // print(responce.data.toString());
    log(responce.data.toString());

 

  }


    Future<captine> cap_info() async {
    Response responce = await dio
        .post('https://motaha2001.pythonanywhere.com/api/cap_info');
    //Specialists specialists = Specialists.fromJson(responce.data);
    // print(responce.data.toString());
    log(responce.data.toString());

    captine test = captine.fromJson(responce.data); 

    return test;
  }


    Future<List<PassTravel>> alltravel() async {
    Response responce = await dio.post('https://motaha2001.pythonanywhere.com/api/buss');
    //Specialists specialists = Specialists.fromJson(responce.data);
    // print(responce.data.toString());
    log(responce.data.toString());

    List<PassTravel> test = responce.data.map<PassTravel>((e) {
      return PassTravel.fromJson(e);
    }).toList();

    return test;
  }
}
