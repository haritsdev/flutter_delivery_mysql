import 'dart:convert';

class Role {
  String? id;
  String? name;
  String? image;
  String? route;

  Role({this.id, this.name, this.image, this.route});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      route: json["route"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "route": route,
      };
}

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());
