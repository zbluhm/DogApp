import 'package:dog_app_client/data/rest_ds.dart';
import 'package:dog_app_client/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  LoginScreenState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ScopedModelDescendant<GlobalModel>(
      builder: (BuildContext context, Widget child, GlobalModel model) {
        if (model.user != null && model.user.isLoggedIn) {
          print("User logged in!");
          Navigator.of(_ctx).pushReplacementNamed("/home");
        }
        var loginBtn = new RaisedButton(
          onPressed: () {
            final form = formKey.currentState;
            if (form.validate()) {
              setState(() {
                _isLoading = true;
              });
              form.save();
              model.doLogin(_username, _password);
            }
          },
          child: new Text("sign in"),
          color: Color.fromRGBO(98,191,237, 1.0),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        );

        final loginButton = Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                // Navigator.of(context).pushNamed(HomePage.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Log In', style: TextStyle(color: Colors.white)),
            ),
          ),
        );

        var loginForm = new ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Center(
              child: new Text(
                "dogster",
                textScaleFactor: 5.7,
                style: new TextStyle(
                  color: Color.fromRGBO(251,247,251, 1.0),
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            new Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      onSaved: (val) => _username = val,
                      validator: (val) {
                        return val.length < 3
                            ? "Username must have atleast 3 chars"
                            : null;
                      },
                      decoration: new InputDecoration(
                        labelText: "username",
                        icon: new Icon(Icons.account_circle),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      // TODO: validate password input, yikes
                      onSaved: (val) => _password = val,
                      decoration: new InputDecoration(
                        labelText: "password",
                        icon: new Icon(Icons.lock_outline),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isLoading ? new CircularProgressIndicator() : loginBtn,
            new FlatButton(
                onPressed: () => Navigator.of(_ctx).pushNamed('/signup'),
                child: Text(
                  "i'm new",
                  style: TextStyle(color: Colors.black54),
                )
            )
          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
        );
        return new Scaffold(
          appBar: null,
          backgroundColor: Color.fromRGBO(53,144,243, 1.0),
          body: new Center(
              child: ClipRect(
                child: new Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: loginForm,
                ),
              ),
            ),
        );
      },
    );
  }
}
