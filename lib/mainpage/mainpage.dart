// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:country_state_picker_plus/country_state_picker_plus.dart';

import 'package:weather/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

final username = 'chinedulink12 ';

WeatherFactory _ww = WeatherFactory("a0a2e468c8735e63a51df33a46eb6a7e");

TextStyle big = GoogleFonts.ubuntu(
    textStyle: TextStyle(fontSize: 48, fontWeight: FontWeight.bold));

Weather? k;

class _WeatherpageState extends State<Weatherpage> {
  // var cities = [];
  // Future<void> fetchCities(String query) async {
  //   final username = 'YOUR_USERNAME'; // Replace with your GeoNames username
  //   final apiUrl =
  //       'http://api.geonames.org/searchJSON?q=$query&maxRows=10&username=$username';

  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);

  //     setState(() {
  //       cities = [];
  //       for (var city in jsonData['geonames']) {
  //         cities.add(city['name']);
  //       }
  //     });
  //   } else {
  //     throw Exception('Failed to fetch cities');
  //   }
  // }
  // List<Map<String, String>>? citidad = [];
  // Future<void> pppa() async {
  //   Dadd citadel = Dadd();
  //   await citadel.jkj();
  //   print(citadel.citiddd);
  //   setState(() {
  //     citidad = citadel.citiddd;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  String city = 'Rathnapura';

  @override
  Widget build(BuildContext context) {
    _ww.currentWeatherByCityName(city).then((w) => setState(() {
          k = w;
        }));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child: buildui()),
      ),
    );
  }

  buildui() {
    if (k == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
            Color.fromARGB(255, 111, 176, 230),
            Colors.blue.shade900
          ])),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 8,
            // ),
            SearchFi_gdgd(),
            SizedBox(
              height: 20,
            ),
            Text(
              city,
              style: big,
            ),
            Image.asset('assets/Cloud 2.png'),
            Text(
              '${k?.temperature?.celsius}',
              style: big,
            ),
            Text(
              '${k?.weatherDescription}',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Contain(
                    img: 'assets/feellike 3.png',
                    value: '${k?.cloudiness}',
                    explain: 'feelslike'),
                SizedBox(
                  width: 8,
                ),
                Contain(
                    img: 'assets/humidity 3.png',
                    value: '${k?.windSpeed}',
                    explain: 'humidity')
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Contain(
                    img: 'assets/feellike 3.png',
                    value: '${k?.sunrise}',
                    explain: 'feelslike'),
                SizedBox(
                  width: 8,
                ),
                Contain(
                    img: 'assets/humidity 3.png',
                    value: '${k?.sunset}',
                    explain: 'humidity')
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Contain(
                    img: 'assets/feellike 3.png',
                    value: '${k?.tempMax}',
                    explain: 'feelslike'),
                SizedBox(
                  width: 8,
                ),
                Contain(
                    img: 'assets/humidity 3.png',
                    value: '${k?.humidity}%',
                    explain: 'humidity')
              ],
            ),
          ],
        ),
      ),
    );
  }

  SearchFi_gdgd() {
    String result = '';
    String resultsss = '';
    String resultss = '';

    return Column(
      children: [
        CountryStatePickerPlus(
          onCityChanged: (value) {
            setState(() {
              city = value;
            });
          },
          onCountryChanged: (value) => resultss = value,
          onStateChanged: (value) => resultsss = '$value',
        ),
      ],
    );
  }
}
// class Yo extends StatelessWidget {
//   const Yo({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, mainAxisExtent: 10),
//       children: [
//         Contain(
//             img: 'assets/feellike 3.png',
//             value: '26.01 c',
//             explain: 'feelslike'),
//         Contain(img: 'assets/humidity 3.png', value: '96%', explain: 'humidity')
//       ],
//     );
//   }
// }

// Widget? search() {
//   return
// }

// Widget? grid() {
//   return GridView.count(
//     crossAxisCount: 2,
//     children: [
//       contain('assets/feellike 3.png', '26.01 c', 'feelslike'),
//       contain('assets/humidity 3.png', '96%', 'humidity'),
//     ],
//   );
// }

// contain(String img, String value, String explan) {
//   Contain();
// }

class Contain extends StatelessWidget {
  Contain({
    required this.img,
    required this.value,
    required this.explain,
    super.key,
  });
  String img;
  String value;
  String explain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 148,
        height: 123,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blue[500]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Image.asset(img), Text(value), Text(explain)],
        ),
      ),
    );
  }
}

// class Dadd {
//   List<Map<String, String>>? citiddd;

//   Dadd({this.citiddd});
//   Future<void> jkj() async {
//     final res = await get(Uri.parse(
//         'http://api.geonames.org/searchJSON?name=&maxRows=1000&username=chinedulink12'));
//     final Map<String, dynamic> dat = jsonDecode(res.body);
//     final List<dynamic> cityList = dat['geonames'];

//     List<Map<String, String>> tempList = [];
//     for (var city in cityList) {
//       final String cityName = city['name'];
//       final String countryName = city['countryName']; // Extract country name
//       tempList.add({'city': cityName, 'country': countryName});
//     }

//     citiddd = tempList;
//     print(citiddd);

//     // print(cityNames);
//   }
