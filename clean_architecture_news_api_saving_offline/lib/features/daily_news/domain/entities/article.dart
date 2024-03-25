// Entities are the ""Business Objects"" of an application

// entities of news app ---> article

import 'package:equatable/equatable.dart';

class Article_entity extends Equatable {
  // Extending equatable to allow easy value comparisions , this will help in managing state in bloc
  final int ? id;
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;

  Article_entity({
    this.id,
     this.author,
     this.title,
     this.description,
     this.url,
    this.urlToImage,
     this.publishedAt,
     this.content,
  });

  factory Article_entity.fromJson(Map<String, dynamic> json) {
    return Article_entity(
      id: json['source']['id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  @override
  List<Object?> get props {
    return [
        id,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}
