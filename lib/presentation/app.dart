import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
import 'countries/binding/countriesBinding.dart';
import 'countries/view/countryListView.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      // navigatorKey: Get.key,
      title: 'Testing Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      getPages: [
        GetPage(
          name: Routes.initialRoute,
          page: () => CountryListView(),
          binding: CountryBinding(),
        ),
      ],
    );
  }
}
