import 'package:flutter_application_6/Signupscreen.dart';
import 'package:flutter_application_6/homescreen.dart';
import 'package:flutter_application_6/loginscreen.dart';
import 'package:go_router/go_router.dart';

class Approuter {
  static final appRouter = GoRouter(
    initialLocation: "/",
    routes: [
    GoRoute(
      path: "/" , 
      name: "SignupScreen", 
      builder: (context, state) => Signupscreen(), 
      ) , 
    GoRoute(
      name: "Loginscreen",
      path: "/login",
      builder: (context, state) {
        final email = state.uri.queryParameters["email"];
        return Loginscreen(prefilledEmail: email);
    },
    ) , 
    GoRoute(
      name: "HomeScreen",
      path: "/home",
      builder: (context, state) => HomeScreen(),
      ), 
  ]
  ); 
}