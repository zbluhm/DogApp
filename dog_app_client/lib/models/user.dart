
class User {
  String _username;
  String _password;
  bool isLoggedIn;
  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }
}