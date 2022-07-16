// To parse this JSON data, do
//
//     final giveAways = giveAwaysFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<GiveAways> giveAwaysFromJson(String str) =>
    List<GiveAways>.from(json.decode(str).map((x) => GiveAways.fromJson(x)));

String giveAwaysToJson(List<GiveAways> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GiveAways {
  GiveAways({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.openGiveawayUrl,
    required this.publishedDate,
    required this.type,
    required this.platforms,
    required this.endDate,
    required this.users,
    required this.status,
    required this.gamerpowerUrl,
    required this.openGiveaway,
  });

  int id;
  String title;
  String worth;
  String thumbnail;
  String image;
  String description;
  String instructions;
  String openGiveawayUrl;
  DateTime publishedDate;
  Type? type;
  String platforms;
  dynamic endDate;
  int users;
  Status? status;
  String gamerpowerUrl;
  String openGiveaway;

  factory GiveAways.fromJson(Map<String, dynamic> json) => GiveAways(
        id: json["id"],
        title: json["title"],
        worth: json["worth"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        instructions: json["instructions"],
        openGiveawayUrl: json["open_giveaway_url"],
        publishedDate: DateTime.parse(json["published_date"]),
        type: typeValues.map[json["type"]],
        platforms: json["platforms"],
        endDate: json["end_date"],
        users: json["users"],
        status: statusValues.map[json["status"]],
        gamerpowerUrl: json["gamerpower_url"],
        openGiveaway: json["open_giveaway"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "worth": worth,
        "thumbnail": thumbnail,
        "image": image,
        "description": description,
        "instructions": instructions,
        "open_giveaway_url": openGiveawayUrl,
        "published_date": publishedDate.toIso8601String(),
        "type": typeValues.reverse[type],
        "platforms": platforms,
        "end_date": endDate,
        "users": users,
        "status": statusValues.reverse[status],
        "gamerpower_url": gamerpowerUrl,
        "open_giveaway": openGiveaway,
      };
}

enum EndDateEnum { N_A }

final endDateEnumValues = EnumValues({"N/A": EndDateEnum.N_A});

enum Status { ACTIVE }

final statusValues = EnumValues({"Active": Status.ACTIVE});

enum Type { DLC, GAME, EARLY_ACCESS, OTHER }

final typeValues = EnumValues({
  "DLC": Type.DLC,
  "Early Access": Type.EARLY_ACCESS,
  "Game": Type.GAME,
  "Other": Type.OTHER
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class GetGiveAwaysSservice {
  Future<List<GiveAways>> getGiveAways() async {
    final response =
        await get(Uri.parse('https://www.gamerpower.com/api/giveaways'));
    final giveaways = giveAwaysFromJson(response.body);
    return giveaways;
  }
}
