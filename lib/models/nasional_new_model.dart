class NasionalNewModel {
    final String? link;
    final String? description;
    final String? title;
    final String? image;
    final List<Post>? posts;

    NasionalNewModel({
        this.link,
        this.description,
        this.title,
        this.image,
        this.posts,
    });

    NasionalNewModel copyWith({
        String? link,
        String? description,
        String? title,
        String? image,
        List<Post>? posts,
    }) => 
        NasionalNewModel(
            link: link ?? this.link,
            description: description ?? this.description,
            title: title ?? this.title,
            image: image ?? this.image,
            posts: posts ?? this.posts,
        );

    factory NasionalNewModel.fromJson(Map<String, dynamic> json) => NasionalNewModel(
        link: json["link"],
        description: json["description"],
        title: json["title"],
        image: json["image"],
        posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
        "title": title,
        "image": image,
        "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Post {
    final String? link;
    final String? title;
    final DateTime? pubDate;
    final String? description;
    final String? thumbnail;

    Post({
        this.link,
        this.title,
        this.pubDate,
        this.description,
        this.thumbnail,
    });

    Post copyWith({
        String? link,
        String? title,
        DateTime? pubDate,
        String? description,
        String? thumbnail,
    }) => 
        Post(
            link: link ?? this.link,
            title: title ?? this.title,
            pubDate: pubDate ?? this.pubDate,
            description: description ?? this.description,
            thumbnail: thumbnail ?? this.thumbnail,
        );

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        link: json["link"],
        title: json["title"],
        pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        description: json["description"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
        "pubDate": pubDate?.toIso8601String(),
        "description": description,
        "thumbnail": thumbnail,
    };
}
