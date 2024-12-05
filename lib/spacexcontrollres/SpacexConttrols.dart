import 'package:advance_flutter_exam_app/Modal/spacexModal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/helpers.dart';

class SpacexConttrols extends ChangeNotifier {
  bool islike = false;
  List<String> Likedata = [];
  late SharedPreferences preferences;

  SpacexConttrols() {
    initSharedPreferenceObject();
  }

  Future<void> initSharedPreferenceObject() async {
    preferences = await SharedPreferences.getInstance();

    Likedata = preferences.getStringList('name') ?? [];
    notifyListeners();
  }

  Future<void> addLikeData({required SpacexModal spacexModal}) async {
    Likedata.add(spacexModal.name);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('name', Likedata);

    notifyListeners();
  }

  Future<void> removelikedata({
    required String name,
  }) async {
    Likedata.remove(name);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('name', Likedata);

    notifyListeners();
  }

  void like() {
    islike = !islike;
    notifyListeners();
  }

  Future<List<SpacexModal>?> fetchNewsData() async {
    return await ApiHelper.apiHelper.spacexApiHelper();
  }
}
