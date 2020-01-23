import 'dart:convert';

Stargazer stargazerFromJson(String str) => Stargazer.fromJson(json.decode(str));
String stargazerToJson(Stargazer data) => json.encode(data.toJson());

class Stargazer {
  Data data;
  Stargazer({this.data});

  factory Stargazer.fromJson(Map<String, dynamic> json) => Stargazer(
    data: Data.fromJson(json['data'])
  );

  Map<String, dynamic> toJson() => {
    'data': data.toJson()
  };
}

class Data {
  List<Members> muse;
  List<Members> aqours;
  Data({this.muse, this.aqours});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    muse: List<Members>.from(json['Muse'].map((x) => Members.fromJson(x))),
    aqours: List<Members>.from(json['Aqours'].map((x)=> Members.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    'Muse': List<dynamic>.from(muse.map((x) => x.toJson())),
    'Aqours': List<dynamic>.from(aqours.map((x) => x.toJson()))
  };
}

class Members {
  String description;
  String name;
  String voice;
  String avatar;
  String cardPhoto;

  Members({
    this.description,
    this.name,
    this.voice,
    this.avatar,
    this.cardPhoto
  });

  factory Members.fromJson(Map<String, dynamic> json) => Members(
    description: json['description'],
    name: json['name'],
    voice: json['voice'],
    avatar: json['avatar'],
    cardPhoto: json['cardPhoto']
  );

  Map<String, dynamic> toJson() => {
    'description': description,
    'name': name,
    'voice': voice,
    'avatar': avatar,
    'cardPhoto': cardPhoto
  };
}