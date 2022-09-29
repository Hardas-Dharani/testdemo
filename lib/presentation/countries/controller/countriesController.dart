import 'dart:async';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testdemo/data/countryListModel.dart';
import 'package:testdemo/repositories/country_repository.dart';

class CountryController extends GetxController {
  List<CountryListResponse> countryListResponse = [];
  Timer? timer;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void onInit() async {
    getCountry();

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
      refreshController.refreshCompleted();
      update();
    } catch (e) {
      rethrow;
    }
  }
}
