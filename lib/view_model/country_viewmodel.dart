import 'package:country_new/model/country.dart';
import 'package:country_new/services/api/web_api.dart';
import 'package:flutter/cupertino.dart';

class viewmodel extends ChangeNotifier {
  final _Webview = WebApi();
  List<Country> countrilist = [];
  void loaddata() async {
    countrilist = await _Webview.getallcountryinfo();
    notifyListeners();
  }
}
