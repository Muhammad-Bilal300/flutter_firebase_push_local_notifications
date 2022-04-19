class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;

  const Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumId: json['userId'],
      id: json['id'],
      title: json['title'],
      url: json['url']
    );
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;

  User({this.id, this.name, this.email, this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email']);
  }
}
