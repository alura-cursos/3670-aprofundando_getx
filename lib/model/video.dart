import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  final int? id;
  final int? userId;
  final String thumbURL;
  final String title;

  Video({
    this.id,
    this.userId,
    required this.thumbURL,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'thumbURL': thumbURL,
      'title': title,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      thumbURL: map['thumbURL'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static List<Video> listFromJson(dynamic json) {
    return List<Video>.from(json.map((video) => Video.fromMap(video)));
  }

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
