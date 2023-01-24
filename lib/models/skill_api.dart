import 'dart:convert';

List<SkillApi> skillApiFromMap(String str) =>
    List<SkillApi>.from(json.decode(str).map((x) => SkillApi.fromMap(x)));

String skillApiToMap(List<SkillApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SkillApi {
  SkillApi({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.order,
    required this.rank,
    required this.patch,
    required this.owned,
    required this.icon,
    required this.type,
    required this.aspect,
    required this.sources,
  });

  int id;
  String name;
  String description;
  String tooltip;
  int order;
  int rank;
  String patch;
  String owned;
  String icon;
  Aspect type;
  Aspect aspect;
  List<Source> sources;

  factory SkillApi.fromMap(Map<String, dynamic> json) => SkillApi(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tooltip: json["tooltip"],
        order: json["order"],
        rank: json["rank"],
        patch: json["patch"],
        owned: json["owned"],
        icon: json["icon"],
        type: Aspect.fromMap(json["type"]),
        aspect: Aspect.fromMap(json["aspect"]),
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "tooltip": tooltip,
        "order": order,
        "rank": rank,
        "patch": patch,
        "owned": owned,
        "icon": icon,
        "type": type.toMap(),
        "aspect": aspect.toMap(),
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
      };
}

class Aspect {
  Aspect({
    required this.id,
    required this.name,
  });

  int id;
  Name? name;

  factory Aspect.fromMap(Map<String, dynamic> json) => Aspect(
        id: json["id"],
        name: nameValues.map[json["name"]],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": nameValues.reverse[name],
      };
}

enum Name {
  WATER,
  FIRE,
  BLUNT,
  PIERCING,
  LIGHTNING,
  NONE,
  EARTH,
  SLASHING,
  ICE,
  WIND,
  PIERCING_FIRE,
  BLUNT_EARTH,
  MAGIC,
  PHYSICAL
}

final nameValues = EnumValues({
  "Blunt": Name.BLUNT,
  "Blunt/Earth": Name.BLUNT_EARTH,
  "Earth": Name.EARTH,
  "Fire": Name.FIRE,
  "Ice": Name.ICE,
  "Lightning": Name.LIGHTNING,
  "Magic": Name.MAGIC,
  "None": Name.NONE,
  "Physical": Name.PHYSICAL,
  "Piercing": Name.PIERCING,
  "Piercing/Fire": Name.PIERCING_FIRE,
  "Slashing": Name.SLASHING,
  "Water": Name.WATER,
  "Wind": Name.WIND
});

class Source {
  Source({
    required this.type,
    required this.text,
    required this.relatedType,
    required this.relatedId,
  });

  Type? type;
  String text;
  dynamic relatedType;
  dynamic relatedId;

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        type: typeValues.map[json["type"]],
        text: json["text"],
        relatedType: json["related_type"],
        relatedId: json["related_id"],
      );

  Map<String, dynamic> toMap() => {
        "type": typeValues.reverse[type],
        "text": text,
        "related_type": relatedType,
        "related_id": relatedId,
      };
}

enum Type { OTHER, DUNGEON }

final typeValues = EnumValues({"Dungeon": Type.DUNGEON, "Other": Type.OTHER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
