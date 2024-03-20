class UserModel {
  final String? userName;
  final String? userEmail;
  final String? userPassword;

  ///Make constructure
  UserModel(
      {required this.userName,
      required this.userEmail,
      required this.userPassword});

  ///Lets make get
  String get _userName => userName ?? '';
  String get _userEmail => userEmail ?? '';
  String get _userPassword => userPassword ?? '';

  ///toJson
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword
    };
  }

  ///FromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userName: json['userName'],
        userEmail: json['userEmail'],
        userPassword: json['userPassword']);
  }
}
