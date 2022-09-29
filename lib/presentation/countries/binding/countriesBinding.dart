import 'package:get/get.dart';

import '../controller/countriesController.dart';

class CountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryController>(
      () => CountryController(),
    );
  }
}
