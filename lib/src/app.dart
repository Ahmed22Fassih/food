import 'package:flutter/material.dart';
import 'package:food/src/pages/signin_page.dart';
import 'package:food/src/scoped_model/food_model.dart';
import 'package:food/src/scoped_model/user_scoped_model.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // add model to screen app
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => FoodModel()),
        ChangeNotifierProvider(create: (ctx) => UserModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Delivery App ",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        routes: {
          "/": (BuildContext context) => SignInPage(),
          "/mainscreen": (BuildContext context) => MainScreen(),
        },
      ),
    );
  }
}
