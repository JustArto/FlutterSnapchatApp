
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_snapchat_app/myJson/country_model.dart';

class JsonLoad {
  late List<CountryModel> countries;
  Future<void> loadJson() async {
    countries = await fetchCountry();
  }

  Future<List<CountryModel>> fetchCountry() async {
    final response = await get(Uri.parse('https://drive.google.com/uc?id=1SuvADk8EeyXU0vjQ159W9Kuxw4Mi_dGA&exprt=download%27'));
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      return list.map((e) => CountryModel.fromJson(e)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List> _loadCountries() async {
    var jsonText =
        await rootBundle.loadString('assets/loadjson/country.json');
    final list = await json.decode(jsonText) as List<dynamic>;
    return list.map((e) => CountryModel.fromJson(e)).toList();
  }
  List<CountryModel> get getCountry => countries;
}