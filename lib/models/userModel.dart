class User{
  String? id;
  String? username;
  String? password;
  String? name;
  User({this.username, this.password, this.name, this.id});
  factory User.fromMap(Map<String, dynamic> map ){
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

