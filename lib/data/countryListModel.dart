class CountryListResponse {
  String? countryId;
  String? countryName;
  String? countryCode;
  String? phoneCode;
  String? isoCode3;
  String? status;
  String? image;

  CountryListResponse(
      {this.countryId,
      this.countryName,
      this.countryCode,
      this.image,
      this.isoCode3,
      this.phoneCode,
      this.status});
}
