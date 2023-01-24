// To parse this JSON data, do
//
//     final cards = cardsFromMap(jsonString);

import 'dart:convert';

List<Cards> cardsFromMap(String str) => List<Cards>.from(json.decode(str).map((x) => Cards.fromMap(x)));

String cardsToMap(List<Cards> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Cards {
    Cards({
        required this.id,
        required this.name,
        required this.description,
        required this.enhancedDescription,
        required this.tooltip,
        required this.movement,
        required this.seats,
        required this.order,
        required this.orderGroup,
        required this.patch,
        required this.itemId,
        required this.tradeable,
        required this.owned,
        required this.image,
        required this.icon,
        required this.bgm,
        required this.sources,
    });

    int id;
    String name;
    String description;
    String enhancedDescription;
    String tooltip;
    Movement? movement;
    int seats;
    int order;
    int orderGroup;
    String patch;
    int itemId;
    bool tradeable;
    String owned;
    String image;
    String icon;
    String bgm;
    List<Source> sources;

    factory Cards.fromMap(Map<String, dynamic> json) => Cards(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        enhancedDescription: json["enhanced_description"],
        tooltip: json["tooltip"],
        movement: movementValues.map[json["movement"]],
        seats: json["seats"],
        order: json["order"],
        orderGroup: json["order_group"],
        patch: json["patch"],
        itemId: json["item_id"] == null ? null : json["item_id"],
        tradeable: json["tradeable"],
        owned: json["owned"],
        image: json["image"],
        icon: json["icon"],
        bgm: json["bgm"] == null ? null : json["bgm"],
        sources: List<Source>.from(json["sources"].map((x) => Source.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "enhanced_description": enhancedDescription,
        "tooltip": tooltip,
        "movement": movementValues.reverse[movement],
        "seats": seats,
        "order": order,
        "order_group": orderGroup,
        "patch": patch,
        "item_id": itemId == null ? null : itemId,
        "tradeable": tradeable,
        "owned": owned,
        "image": image,
        "icon": icon,
        "bgm": bgm == null ? null : bgm,
        "sources": List<dynamic>.from(sources.map((x) => x.toMap())),
    };
}

enum Movement { TERRESTRIAL, AIRBORNE }

final movementValues = EnumValues({
    "Airborne": Movement.AIRBORNE,
    "Terrestrial": Movement.TERRESTRIAL
});

class Source {
    Source({
        required this.type,
        required this.text,
        required this.relatedType,
        required this.relatedId,
    });

    String type;
    String text;
    RelatedType? relatedType;
    int relatedId;

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        type: json["type"],
        text: json["text"],
        relatedType: json["related_type"] == null ? null : relatedTypeValues.map[json["related_type"]],
        relatedId: json["related_id"] == null ? null : json["related_id"],
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "text": text,
        "related_type": relatedType == null ? null : relatedTypeValues.reverse[relatedType],
        "related_id": relatedId == null ? null : relatedId,
    };
}

enum RelatedType { ACHIEVEMENT, INSTANCE, QUEST }

final relatedTypeValues = EnumValues({
    "Achievement": RelatedType.ACHIEVEMENT,
    "Instance": RelatedType.INSTANCE,
    "Quest": RelatedType.QUEST
});

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
