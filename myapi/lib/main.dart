import 'package:flutter/material.dart';
import 'package:myapi/Pages/Home_page.dart';
import 'package:myapi/Pages/Login.dart';

import 'package:myapi/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to remove deboug banner
      // home: LoginPage(),
      initialRoute: MyRoutes.LoginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => Home_page(),
        // MyRoutes.CarRoute: (context) => CartPage(),
      },
    );
  }
}
