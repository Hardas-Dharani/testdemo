import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testdemo/data/countryListModel.dart';
import 'package:testdemo/repositories/country_repository.dart';

class CountryController extends GetxController {
  List<CountryListResponse> countryListResponse = [];
  Timer? timer;
  final Key linkKey = GlobalKey();

  final ScrollController scrollController = ScrollController();
  @override
  void onInit() async {
    getCountry();
    scrollController.addListener(() {});
    super.onInit();
  }

  @override
  void onReady() async {
    timer =
        Timer.periodic(const Duration(seconds: 10), (Timer t) => removeData());

    super.onReady();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  removeData() {
    countryListResponse.removeAt(0);
    update();
  }

  getCountry() async {
    try {
      countryListResponse = [];
      countryListResponse = await CountryRepositoryIml().getCountryList();

      update();
    } catch (e) {
      rethrow;
    }
  }
}
