import 'package:citylist/models/client.dart';

class CityAPI {
  final String name;

  CityAPI({this.name});

  static Future<List<CityAPI>> getCities() async {
    GqlClient client = new GqlClient();
    var result = await client.query(query: CityQuery);
    List data = result['cities'];
    List<CityAPI> _cities = data
        .map<CityAPI>((city) => CityAPI(
              name: city["name"],
            ))
        .toList();
    return _cities;
  }
}

class AreaAPI {
  final String name;
  List<SubAreaAPI> subareas;

  AreaAPI({this.name, this.subareas});

  static Future<List<AreaAPI>> getAreas(cityName) async {
    GqlClient client = new GqlClient();
    var result =
        await client.query(query: AreaQuery, variables: {'cityName': cityName});
    List data = result['areas'];
    List<AreaAPI> _areas = data
        .map<AreaAPI>((area) => AreaAPI(
              name: area["name"],
            ))
        .toList();
    return _areas;
  }
}

class SubAreaAPI {
  final String id;
  final String name;

  SubAreaAPI({this.id, this.name});

  static Future<List<SubAreaAPI>> getSubAreas(areaName) async {
    GqlClient client = new GqlClient();
    var result = await client
        .query(query: SubAreaQuery, variables: {'areaName': areaName});
    List data = result['subareas'];
    List<SubAreaAPI> _subareas = data
        .map<SubAreaAPI>((subarea) => SubAreaAPI(
              name: subarea["name"],
            ))
        .toList();
    return _subareas;
  }
}

const String CityQuery = r'''
query cities{
  cities{
    name
  }
}
''';

const String AreaQuery = r'''
query areas($cityName: String){
areas(cityName: $cityName){
name
}
}''';

const String SubAreaQuery = r'''
query subareas($areaName: String){
  subareas(areaName: $areaName) {
    name
  }
}
''';
