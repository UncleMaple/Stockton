import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stockton/util/net/api.dart';
import 'package:stockton/util/net/result_data.dart';

const String _token = "pKkaYtTxTOfVgFaWkheC5Cl0IcSRkXGa";

const Map<String, String> _headers = {"Authorization": _token};

class ImageHosting {
  Future<String> upload(File image) async {
    String imgUrl;
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    // var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.fromMap({
      "smfile": await MultipartFile.fromFile(path, filename: name),
    });
    ResultData res = await httpManager.netFetch("https://sm.ms/api/v2/", formData, _headers, new Options(method: 'POST'));
    if (res.result){
      imgUrl = res.data['data']['url'];
    }

    return imgUrl;
  }
}
