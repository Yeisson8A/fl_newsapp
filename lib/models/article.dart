import 'dart:convert';
import 'models.dart';

class Article {
    Source source;
    String? author;
    String title;
    dynamic description;
    String url;
    dynamic urlToImage;
    DateTime publishedAt;
    dynamic content;

    Article({
        required this.source,
        this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}