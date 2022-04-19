class UserModel {
  String? uid;
  String? email;
  String? name;
  String? password;

  UserModel({this.uid, this.email, this.name, this.password});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'password': password};
  }
}
