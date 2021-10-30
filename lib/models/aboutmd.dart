// To parse this JSON data, do
//
//     final aboutMd = aboutMdFromJson(jsonString);

import 'dart:convert';

List<AboutMd> aboutMdFromJson(String str) => List<AboutMd>.from(json.decode(str).map((x) => AboutMd.fromJson(x)));

String aboutMdToJson(List<AboutMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutMd {
    AboutMd({
        this.id,
        this.title,
        this.company,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.publishedAt,
        this.aboutMdId,
    });

    String id;
    String title;
    String company;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    DateTime publishedAt;
    String aboutMdId;

    factory AboutMd.fromJson(Map<String, dynamic> json) => AboutMd(
        id: json["_id"],
        title: json["Title"],
        company: json["Company"],
        content: json["Content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        publishedAt: DateTime.parse(json["published_at"]),
        aboutMdId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Title": title,
        "Company": company,
        "Content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "published_at": publishedAt.toIso8601String(),
        "id": aboutMdId,
    };
}
