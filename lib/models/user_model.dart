class UserModel {
  String? username;
  String? email;
  String? phoneNumber;
  String? userId;

  UserModel({
    this.username,
    this.email,
    this.phoneNumber,
    this.userId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String?;
    email = json['email'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    userId = json['userId'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['email'] = email;
    json['phoneNumber'] = phoneNumber;
    json['userId'] = userId;
    return json;
  }
}
