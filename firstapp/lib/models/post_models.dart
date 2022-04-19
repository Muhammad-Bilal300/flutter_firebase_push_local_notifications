class CreatePost {
  // final int id;
  final String title;

  CreatePost({required this.title});

  factory CreatePost.fromJson(Map<String, dynamic> json) {
    return CreatePost(
      // id: json['id'],
      title: json['title'],
    );
  }
}
