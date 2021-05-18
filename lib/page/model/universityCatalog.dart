class UniversityCatalog {
  List<University> university;
  UniversityCatalog.fromJson(Map<String, dynamic> json) {
    university = <University>[];
    university = List.from(json['universities'])
        .map((e) => University.fromJson(e))
        .toList();
  }
}

class University {
  String alphaTwoCode;
  String country;
  String domain;
  String name;
  String webPage;

  University.fromJson(Map<String, dynamic> json) {
    alphaTwoCode = json['alpha_two_code'];
    country = json['country'];
    domain = json['domain'];
    name = json['name'];
    webPage = json['web_page'];
  }
}
