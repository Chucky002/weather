// import country_state_city package
import 'package:country_state_city/country_state_city.dart';

void dada() async {
  final cities = await getAllCities();
  print(cities);
}
