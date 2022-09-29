import 'dart:io';

import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum CountryType { getCountry }

class CountryAPI implements APIRequestRepresentable {
  final CountryType type;

  CountryAPI._({required this.type});

  CountryAPI.getcountry() : this._(type: CountryType.getCountry);

  @override
  String get endpoint => APIEndpoint.baseurl;

  @override
  String get path {
    switch (type) {
      case CountryType.getCountry:
        return APIEndpoint.middleWare + APIEndpoint.getCountries;
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {
        "Content-Type": "application/x-www-form-urlencoded",
      };

// if need to send any URL Parameters to the API use this
  @override
  Map<String, dynamic> get urlParams {
    return {};
  }

  @override
  get body {}

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
