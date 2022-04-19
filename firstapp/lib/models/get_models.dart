class Posts {
  // int? id;
  // String? name;
  // String? userName;
  // that values will pass may be null or provided later
  int userId;
  int id;
  String title;
  String body;
  // List<dynamic> address = [ ];
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    // required this.address
  });
  // Posts({this.id, this.name, this.userName});
}
