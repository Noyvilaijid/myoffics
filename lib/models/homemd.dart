// To parse this JSON data, do
//
//     final homeMd = homeMdFromJson(jsonString);

import 'dart:convert';

List<HomeMd> homeMdFromJson(String str) => List<HomeMd>.from(json.decode(str).map((x) => HomeMd.fromJson(x)));

String homeMdToJson(List<HomeMd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeMd {
    HomeMd({
        this.details,
        this.localimage,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.titlepage,
        this.publishedAt,
        this.homeMdId,
    });

    String details;
    List<Localimage> localimage;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String titlepage;
    DateTime publishedAt;
    String homeMdId;

    factory HomeMd.fromJson(Map<String, dynamic> json) => HomeMd(
        details: json["details"],
        localimage: List<Localimage>.from(json["localimage"].map((x) => Localimage.fromJson(x))),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        titlepage: json["titlepage"],
        publishedAt: DateTime.parse(json["published_at"]),
        homeMdId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "details": details,
        "localimage": List<dynamic>.from(localimage.map((x) => x.toJson())),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "titlepage": titlepage,
        "published_at": publishedAt.toIso8601String(),
        "id": homeMdId,
    };
}

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
        this.localimageId,
    });

    String id;
    String name;
    String alternativeText;
    String caption;
    String hash;
    String ext;
    String mime;
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
    String localimageId;

    factory Localimage.fromJson(Map<String, dynamic> json) => Localimage(
        id: json["_id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
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
        localimageId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "hash": hash,
        "ext": ext,
        "mime": mime,
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
        "id": localimageId,
    };
}

class Formats {
    Formats({
        this.thumbnail,
    });

    Thumbnail thumbnail;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
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
    String ext;
    String mime;
    int width;
    int height;
    double size;
    dynamic path;
    String url;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
    };
}
