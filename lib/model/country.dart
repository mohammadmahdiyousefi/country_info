class Country {
  Country(this.common, this.official, this.region, this.flags, this.ccn3,
      this.languages, this.capital, this.svg);
  String? common;
  String? official;
  String? region;
  String? flags;
  String? ccn3;
  String? languages;
  String? capital;
  String? svg;

  factory Country.frommapjson(Map<String, dynamic> jasonmapobject) {
    return Country(
      jasonmapobject['name']['common'],
      jasonmapobject['name']['official'],
      jasonmapobject['region'],
      jasonmapobject['flags']['png'],
      jasonmapobject['ccn3'],
      jasonmapobject['languages'].toString(),
      jasonmapobject['capital'].toString(),
      jasonmapobject['coatOfArms']['png'],
    );
  }
}
