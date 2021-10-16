
import 'dart:convert';

List<Meeting> meetingFromJson(String str) => List<Meeting>.from(json.decode(str).map((x) => Meeting.fromJson(x)));

String meetingToJson(List<Meeting> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meeting {
    Meeting({
        this.id,
        this.name,
        this.surename,
        this.organization,
        this.phone,
        this.email,
        this.datetime,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.createdBy,
        this.updatedBy,
        this.meetingId,
    });

    String id;
    String name;
    String surename;
    String organization;
    String phone;
    String email;
    DateTime datetime;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    AtedBy createdBy;
    AtedBy updatedBy;
    String meetingId;

    factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json["_id"],
        name: json["Name"],
        surename: json["Surename"],
        organization: json["Organization"],
        phone: json["Phone"],
        email: json["Email"],
        datetime: DateTime.parse(json["Datetime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        meetingId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
        "Surename": surename,
        "Organization": organization,
        "Phone": phone,
        "Email": email,
        "Datetime": datetime.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "id": meetingId,
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
