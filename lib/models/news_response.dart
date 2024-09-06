import 'dart:convert';
import 'models.dart';

class NewsResponse {
    String status;
    int totalResults;
    List<Article> articles;

    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromRawJson(String str) => NewsResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}