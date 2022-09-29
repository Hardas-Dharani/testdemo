import '../interface/countryList.dart';

abstract class CountryRepository {
  Future<List<CountryListModel>> getCountryList();
}
