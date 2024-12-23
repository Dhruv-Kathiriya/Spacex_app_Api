import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Modal/spacexModal.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();
  Future<List<SpacexModal>?> spacexApiHelper() async {
    log("Code is started...");
    Uri url = Uri.parse("https://api.spacexdata.com/v4/launches");
    http.Response res = await http.get(url);

    log("Response code : ${res.statusCode}");

    if (res.statusCode == 200) {
      log("If is run....");
      List apiData = jsonDecode(res.body);

      List<SpacexModal> allSpacexlist = apiData
          .map(
            (e) => SpacexModal.fromJson(
              data: e,
            ),
          )
          .toList();
      return allSpacexlist;
    }

    return null;
  }
}
