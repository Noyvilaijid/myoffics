
import 'dart:convert';
List<HomeMD> homeModelFromJson(String str) => List<HomeMD>.from(json.decode(str).map((x) => HomeMD.fromJson(x)));
String homeModelToJson(List<HomeMD> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class HomeMD {
    HomeMD({
        this.localimage,
        this.id,
        this.titlepage,
        this.details,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.createdBy,
        this.updatedBy,
        this.iconImageStrapiId,
    });

    List<Localimage> localimage;
    String id;
    String titlepage;
    String details;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    AtedBy createdBy;
    AtedBy updatedBy;
    String iconImageStrapiId;

    factory HomeMD.fromJson(Map<String, dynamic> json) => HomeMD(
        localimage: List<Localimage>.from(json["localimage"].map((x) => Localimage.fromJson(x))),
        id: json["_id"],
        titlepage: json["titlepage"],
        details: json["details"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: AtedBy.fromJson(json["created_by"]),
        updatedBy: AtedBy.fromJson(json["updated_by"]),
        iconImageStrapiId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "localimage": List<dynamic>.from(localimage.map((x) => x.toJson())),
        "_id": id,
        "titlepage": titlepage,
        "details": details,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy.toJson(),
        "id": iconImageStrapiId,
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

    Id id;
    dynamic username;
    Firstname firstname;
    Lastname lastname;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Id atedById;

    factory AtedBy.fromJson(Map<String, dynamic> json) => AtedBy(
        id: idValues.map[json["_id"]],
        username: json["username"],
        firstname: firstnameValues.map[json["firstname"]],
        lastname: lastnameValues.map[json["lastname"]],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        atedById: idValues.map[json["id"]],
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "username": username,
        "firstname": firstnameValues.reverse[firstname],
        "lastname": lastnameValues.reverse[lastname],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": idValues.reverse[atedById],
    };
}

enum Id { THE_613_F03_F2_FE7_C653_B7_DEBAA3_E }

final idValues = EnumValues({
    "613f03f2fe7c653b7debaa3e": Id.THE_613_F03_F2_FE7_C653_B7_DEBAA3_E
});

enum Firstname { NOY }

final firstnameValues = EnumValues({
    "Noy": Firstname.NOY
});

enum Lastname { VILAIJID }

final lastnameValues = EnumValues({
    "Vilaijid": Lastname.VILAIJID
});

class Localimage {
    Localimage({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.width,
        this.height,
        this.url,
        this.formats,
        this.provider,
        this.related,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.createdBy,
        this.updatedBy,
        this.localimageId,
    });

    String id;
    String name;
    String alternativeText;
    String caption;
    String hash;
    Ext ext;
    Mime mime;
    double size;
    int width;
    int height;
    String url;
    Formats formats;
    String provider;
    List<String> related;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Id createdBy;
    Id updatedBy;
    String localimageId;

    factory Localimage.fromJson(Map<String, dynamic> json) => Localimage(
        id: json["_id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
        url: json["url"],
        formats: Formats.fromJson(json["formats"]),
        provider: json["provider"],
        related: List<String>.from(json["related"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        createdBy: idValues.map[json["created_by"]],
        updatedBy: idValues.map[json["updated_by"]],
        localimageId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "width": width,
        "height": height,
        "url": url,
        "formats": formats.toJson(),
        "provider": provider,
        "related": List<dynamic>.from(related.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "created_by": idValues.reverse[createdBy],
        "updated_by": idValues.reverse[updatedBy],
        "id": localimageId,
    };
}

enum Ext { JPEG }

final extValues = EnumValues({
    ".jpeg": Ext.JPEG
});

class Formats {
    Formats({
        this.thumbnail,
        this.medium,
        this.small,
        this.large,
    });

    Small thumbnail;
    Small medium;
    Small small;
    Small large;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Small.fromJson(json["thumbnail"]),
        medium: json["medium"] == null ? null : Small.fromJson(json["medium"]),
        small: Small.fromJson(json["small"]),
        large: json["large"] == null ? null : Small.fromJson(json["large"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "medium": medium == null ? null : medium.toJson(),
        "small": small.toJson(),
        "large": large == null ? null : large.toJson(),
    };
}

class Small {
    Small({
        this.name,
        this.hash,
        this.ext,
        this.mime,
        this.width,
        this.height,
        this.size,
        this.path,
        this.url,
    });

    String name;
    String hash;
    Ext ext;
    Mime mime;
    int width;
    int height;
    double size;
    dynamic path;
    String url;

    factory Small.fromJson(Map<String, dynamic> json) => Small(
        name: json["name"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
    };
}

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({
    "image/jpeg": Mime.IMAGE_JPEG
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
