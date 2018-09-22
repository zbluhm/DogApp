
import 'package:dog_app_client/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalModel extends Model {

  User user;

  void setUserLoggedIn(User user) {
    this.user = user;
    this.user.isLoggedIn = true;

    notifyListeners();
  }

}