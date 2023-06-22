import 'package:country_new/model/country.dart';
import 'package:country_new/services/api/network_api.dart';
import 'package:dio/dio.dart';

class WebApi implements NetworkApi {
  @override
  Future<List<Country>> getallcountryinfo() async {
    var response = await Dio().get('https://restcountries.com/v3.1/all');
    List<Country> countrylist = response.data
        .map<Country>((JsonMapObject) => Country.frommapjson(JsonMapObject))
        .toList();
    return countrylist;
  }
}
