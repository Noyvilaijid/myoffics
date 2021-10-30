// To parse this JSON data, do
//
//     final pastwork = pastworkFromJson(jsonString);

import 'dart:convert';

List<Pastwork> pastworkFromJson(String str) => List<Pastwork>.from(json.decode(str).map((x) => Pastwork.fromJson(x)));

String pastworkToJson(List<Pastwork> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pastwork {
    Pastwork({
        this.image,
        this.id,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.publishedAt,
        this.pastworkId,
    });

    List<Image> image;
    String id;
    String title;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    DateTime publishedAt;
    String pastworkId;

    factory Pastwork.fromJson(Map<String, dynamic> json) => Pastwork(
        image: List<Image>.from(json["Image"].map((x) => Image.fromJson(x))),
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        publishedAt: DateTime.parse(json["published_at"]),
        pastworkId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Image": List<dynamic>.from(image.map((x) => x.toJson())),
        "_id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "published_at": publishedAt.toIso8601String(),
        "id": pastworkId,
    };
}

class Image {
    Image({
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
        this.imageId,
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
    String imageId;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
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
        imageId: json["id"],
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
        "id": imageId,
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
