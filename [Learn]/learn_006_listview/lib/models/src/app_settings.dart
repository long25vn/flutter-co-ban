import 'package:listview/models/src/countries.dart';
import 'package:listview/models/src/weather.dart';

List<City> AllAddedCities = [
  new City(name: "Portland", country: Country.US, active: true, listIdx: 0),
  new City(name: "Berlin", country: Country.DE, active: false, listIdx: 1),
  new City(
      name: "Buenos Aires", country: Country.BR, active: false, listIdx: 2),
  new City(name: "Chaing Mai", country: Country.TH, active: false, listIdx: 3),
  new City(name: "Eugene", country: Country.US, active: false, listIdx: 4),
  new City(name: "Georgetown", country: Country.ZA, active: false, listIdx: 5),
  new City(name: "London", country: Country.GB, active: false, listIdx: 6),
  new City(name: "New York", country: Country.US, active: false, listIdx: 7),
  new City(name: "Panama City", country: Country.PA, active: true, listIdx: 8),
  new City(
      name: "San Francisco", country: Country.US, active: false, listIdx: 9),
  new City(
      name: "San Francisco", country: Country.US, active: false, listIdx: 10),
  new City(name: "Tokyo", country: Country.JP, active: false, listIdx: 11),
];

List<City> NullList = [
];

class AppSettings {
  TemperatureUnit selectedTemperature = TemperatureUnit.celsius;
  City activeCity = AllAddedCities[0];
}

class City {
  String name;
  Country country;
  bool active = false;
  bool isdefault = false;
  int listIdx;

  City({this.name, this.country, this.active, this.listIdx}) {
    assert(name != null);
    if (listIdx == null) {
      listIdx = AllAddedCities.length + 1;
    }
  }

  City.fromUserInput() {
    if (this.listIdx == null) {
      this.listIdx = AllAddedCities.length + 1;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country &&
          listIdx == other.listIdx;

  @override
  int get hashCode => name.hashCode ^ country.hashCode ^ listIdx.hashCode;
}
