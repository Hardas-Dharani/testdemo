import '../../data/countryListModel.dart';

class CountryListModel extends CountryListResponse {
  CountryListModel(
      {this.countryCode,
      this.countryId,
      this.countryName,
      this.image,
      this.isoCode3,
      this.phoneCode,
      this.status})
      : super(
            countryCode: countryCode,
            countryName: countryName,
            countryId: countryId,
            isoCode3: isoCode3,
            image: image,
            phoneCode: phoneCode,
            status: status);
  String? countryId;
  String? countryName;
  String? countryCode;
  String? phoneCode;
  String? isoCode3;
  String? status;
  String? image;

  factory CountryListModel.fromJson(Map<String, dynamic>? json) {
    return CountryListModel(
        countryId: json!['country_id'],
        countryName: json['country_name'],
        countryCode: json['country_code'],
        phoneCode: json['phone_code'],
        isoCode3: json['iso_code_3'],
        status: json['status'],
        image: json['image']);
  }
}
