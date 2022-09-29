import 'dart:convert';

import 'package:testdemo/domain/interface/countryList.dart';
import 'package:testdemo/domain/repositories/country_repository.dart';
import 'package:testdemo/provider/network/api/country_api.dart';

class CountryRepositoryIml extends CountryRepository {
  // @override
  // Future<BiometricUserModel> bioMetricLogin(
  //     String email, String password, bool isAuthenticated) async {
  //   try {
  //     final response = await AuthAPI.login(email, password).request();
  //     BiometricUserModel biometricUserModel =
  //         BiometricUserModel.fromJson(json.decode(response));

  //     print(biometricUserModel.emailAddress);
  //     print(biometricUserModel.passwordAuth);
  //     return biometricUserModel;
  //   } catch (e) {
  //     print('repo exception $e');
  //     rethrow;
  //   }
  // }

  @override
  Future<List<CountryListModel>> getCountryList() async {
    try {
      final response = await CountryAPI.getcountry().request();

      // CountryListModel countryListModel =
      //     CountryListModel.fromJson(json.decode(response));
      final result = json.decode(response);
      List<CountryListModel> countryListModel = List<CountryListModel>.from(
          result['data']['countries']
              .map((model) => CountryListModel.fromJson(model)));

      return countryListModel;
    } catch (e) {
      print('repo exception $e');
      rethrow;
    }
  }
}
