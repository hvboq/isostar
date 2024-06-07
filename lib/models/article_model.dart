class ArticleModel {
  final int id;
  final String image;
  final int likes;
  final String date;
  final String content;
  final bool liked;
  final String user;

  ArticleModel(
      {required this.id,
      required this.image,
      required this.likes,
      required this.date,
      required this.content,
      required this.liked,
      required this.user});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      image: json['image'],
      likes: json['likes'],
      date: json['date'],
      content: json['content'],
      liked: json['liked'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['likes'] = likes;
    data['date'] = date;
    data['content'] = content;
    data['liked'] = liked;
    data['user'] = user;
    return data;
  }
}
