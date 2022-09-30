import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:testdemo/presentation/countries/controller/countriesController.dart';

class CountryListView extends GetView<CountryController> {
  CountryListView({super.key});
  final RefreshController refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SmartRefresher(
        // scrollController: controller.scrollController,
        header: const WaterDropHeader(),
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: () async {
          await controller.getCountry();
          refreshController.refreshCompleted();
        },
        controller: refreshController,
        child: GetBuilder<CountryController>(builder: (_) {
          return controller.countryListResponse.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.countryListResponse.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(controller
                        .countryListResponse[index].countryName
                        .toString()),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    ));
  }
}
