import 'dart:convert';

import 'dart:ffi';

class Home {
  final int? id;
  final String? type;
  final String? name;
  final String? gender;
  final String? subtitle;
  final String? photo;
  final String? content;
  final String? author;
  final int? birthday;
  final int? expired;
  final int? createAt;
  final String? tag;

  Home({
    this.id,
    this.type,
    this.name,
    this.gender,
    this.subtitle,
    this.photo,
    this.content,
    this.author,
    this.birthday,
    this.expired,
    this.createAt,
    this.tag
  });


  factory Home.fromCandidatesJson(dynamic json) {
    return Home(
      id: json["id"],
      type: "candidate",
      name: json["name"],
      gender: json["gender"] == "m" ? "Male" : "Female" ,
      photo: json["photo"],
      birthday: json["birthday"],
      expired: json["expired"]
    );
  }

  factory Home.fromBlogsJson(Map<String, dynamic> json) {
    return Home(
        id: json['id'] as int?,
        type: "blog",
        name: json['title'] as String?,
        subtitle: json['subTitle'] as String?,
        photo: json['photo'] as String?,
        content: json['content'] as String?,
        author: json['author'] as String?,
        createAt: json['create_at'] as int?,
        tag: json['tag'] as String?
    );
  }
}
