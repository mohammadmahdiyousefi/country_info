import 'package:country_new/model/country.dart';

abstract class NetworkApi {
  Future<List<Country>> getallcountryinfo();
}
