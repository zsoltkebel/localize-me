import 'package:flutter/material.dart';
import 'package:localize_me/model/user.dart';
import 'package:localize_me/screens/authenticate/authenticate.dart';
import 'package:localize_me/screens/create/create.dart' as screen;
import 'package:localize_me/screens/create/definition.dart';
import 'package:localize_me/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //TODO remove line below
    // return screen.Create();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
