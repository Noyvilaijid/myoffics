
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
        this.createdBy,
        this.updatedBy,
        this.contactId,
    });

    String id;
    String contact;
    String details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    AtedBy createdBy;
    AtedBy updatedBy;
    String contactId;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["_id"],
        contact: json["Contact"],
        details: json["Details"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        contactId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Contact": contact,
        "Details": details,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "id": contactId,
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
