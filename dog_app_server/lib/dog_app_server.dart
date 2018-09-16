/// dog_app_server
///
/// A Aqueduct web server.
library dog_app_server;

import 'dart:async';

import 'package:aqueduct/aqueduct.dart';


export 'dart:async';
export 'dart:io';

export 'package:aqueduct/aqueduct.dart';
export 'package:aqueduct/managed_auth.dart';

export 'channel.dart';

class MyChannel extends ApplicationChannel {
  ManagedContext context;

  // TODO: implement entryPoint
  @override
  Future prepare() async {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final store = PostgreSQLPersistentStore.fromConnectionInfo(
        "dog_app", "dog_app", "localhost", 5432, "test_db");
    context = ManagedContext(dataModel, store);
  }

  // TODO: implement entryPoint
  @override
  Controller get entryPoint => null;

}