import 'package:citylist/models/client.dart';

class CityList {
  final String name;

  CityList({this.name});

  static Future<List<CityList>> getCities() async {
    GqlClient client = new GqlClient();
    var result = await client.query(query: CityQuery);
    List data = result['cities'];
    List<CityList> _cities = data
        .map<CityList>((city) => CityList(
              name: city["name"],
            ))
        .toList();
    return _cities;
  }
}

class AreaList {
  final String name;
  List<SubAreaList> subareas;

  AreaList({this.name, this.subareas});

  static Future<List<AreaList>> getAreas(cityName) async {
    GqlClient client = new GqlClient();
    var result =
        await client.query(query: AreaQuery, variables: {'cityName': cityName});
    List data = result['areas'];
    List<AreaList> _areas = data
        .map<AreaList>((area) => AreaList(
              name: area["name"],
            ))
        .toList();
    return _areas;
  }
}

class SubAreaList {
  final String id;
  final String name;

  SubAreaList({this.id, this.name});

  static Future<List<SubAreaList>> getSubAreas(cityName) async {
    GqlClient client = new GqlClient();
    var result = await client
        .query(query: SubAreaQuery, variables: {'areaName': cityName});
    List data = result['subareas'];
    List<SubAreaList> _subareas = data
        .map<SubAreaList>((subarea) => SubAreaList(
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
