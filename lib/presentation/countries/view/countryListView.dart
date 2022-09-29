import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:testdemo/presentation/countries/controller/countriesController.dart';

class CountryListView extends GetView<CountryController> {
  const CountryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      header: const WaterDropHeader(),
      onRefresh: () => controller.getCountry(),
      controller: controller.refreshController,
      child: GetBuilder<CountryController>(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.countryListResponse.isNotEmpty
                ? SizedBox(
                    height: Get.height / 1,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.countryListResponse.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(controller
                            .countryListResponse[index].countryName
                            .toString()),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      }),
    ));
  }
}
