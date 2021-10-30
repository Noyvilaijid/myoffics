// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

List<Contact> contactFromJson(String str) => List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
    Contact({
        this.id,
        this.contact,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.publishedAt,
        this.contactId,
    });

    String id;
    String contact;
    String details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    DateTime publishedAt;
    String contactId;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["_id"],
        contact: json["Contact"],
        details: json["Details"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        publishedAt: DateTime.parse(json["published_at"]),
        contactId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Contact": contact,
        "Details": details,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "published_at": publishedAt.toIso8601String(),
        "id": contactId,
    };
}
