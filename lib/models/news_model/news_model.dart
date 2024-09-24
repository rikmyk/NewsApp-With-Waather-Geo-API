import 'package:intl/intl.dart';

class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  // Helper method to format the publishedAt date
  String? getFormattedDate() {
    if (publishedAt == null) return null;

    try {
      DateTime dateTime = DateTime.parse(publishedAt!);
      return DateFormat('EEEE, dd MMMM yyyy HH:mm a').format(dateTime);
    } catch (e) {
      return null; // Return null or handle the error accordingly
    }
  }

  @override
  String toString() {
    return 'NewsModel(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  @override
  String toString() => 'Source(id: $id, name: $name)';

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
