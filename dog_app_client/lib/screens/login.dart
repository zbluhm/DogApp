


import 'package:dog_app_client/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }

}

class LoginScreenState extends State<LoginScreen> {

  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ScopedModelDescendant<GlobalModel> (
      builder: (BuildContext context, Widget child, GlobalModel model) {
        if (model.user.isLoggedIn) {
          Navigator.of(_ctx).pushReplacementNamed("/home");
        }
        // TODO: Build the login form
      },
    );
  }

}