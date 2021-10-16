
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
        this.createdBy,
        this.updatedBy,
        this.aboutMdId,
    });

    String id;
    String title;
    String company;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    AtedBy createdBy;
    AtedBy updatedBy;
    String aboutMdId;

    factory AboutMd.fromJson(Map<String, dynamic> json) => AboutMd(
        id: json["_id"],
        title: json["Title"],
        company: json["Company"],
        content: json["Content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
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
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "id": aboutMdId,
    };
}

class AtedBy {
    AtedBy({
        this.id,
        this.username,
        this.firstname,
        this.lastname,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.atedById,
    });

    String id;
    dynamic username;
    String firstname;
    String lastname;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String atedById;

    factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: json["_id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        atedById: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": atedById,
    };
}
