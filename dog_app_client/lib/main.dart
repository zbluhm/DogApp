import 'package:dog_app_client/models/global_model.dart';
import 'package:dog_app_client/routes.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ScopedModel<GlobalModel> (
      model: GlobalModel(),
      child: MaterialApp(
        title: 'DogsterTBD',
        theme: new ThemeData(
            primarySwatch: Colors.blue
        ),
        routes: routes,
      ),
    );
  }

}
