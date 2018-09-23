
import 'package:dog_app_client/data/rest_ds.dart';
import 'package:dog_app_client/models/user.dart';
import 'package:dog_app_client/models/userProfile.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalModel extends Model {

  UserProfile userProfile;
  User user;
  RestDataSource api = new RestDataSource();

  void setUserLoggedIn(User user) {
    this.user = user;
    this.user.isLoggedIn = true;

    notifyListeners();
  }

  void doLogin(String username, String password) {
    print("Login called!");
    User newUser = new User("zach", "jake1234");
    setUserLoggedIn(newUser);
//    api.login(username, password).then((User user) {
//      setUserLoggedIn(user);
//    }).catchError((Exception error) => print("error"));
  }

}