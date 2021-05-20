class UniversityCatalog {
  List<University> university;

  UniversityCatalog({this.university});
  factory UniversityCatalog.fromJson(Map<String, dynamic> json) {
    return UniversityCatalog(
        university: List.from(json['universities'])
            .map((e) => University.fromJson(e))
            .toList());
  }
}

class University {
  String alphaTwoCode;
  String country;
  String domain;
  String name;
  String webPage;

  University(
      {this.alphaTwoCode, this.country, this.domain, this.name, this.webPage});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        alphaTwoCode: json['alpha_two_code'],
        country: json['country'],
        domain: json['domain'],
        name: json['name'],
        webPage: json['web_page']);
  }
}
