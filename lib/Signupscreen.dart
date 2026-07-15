import 'package:flutter/material.dart';
import 'package:flutter_application_6/app_theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_6/app_theme_state.dart';
import 'package:go_router/go_router.dart';

class Signupscreen extends StatefulWidget{
  const Signupscreen({super.key});
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Text(
                        "Explore Now",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                      Text(
                        "Join SO today.",
                        style: TextStyle(fontSize: 30),
                      ),

                    const SizedBox(height: 10),

                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),

                    const SizedBox(height: 10),

                    TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                      
                     TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              "Sign Up",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Already Have an Account?")],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                         context.pushNamed(
                          "Loginscreen",
                          queryParameters: {
                            "email": emailController.text,
                          },
                        );
                        },
                        style: ElevatedButton.styleFrom(
                          
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              "Log In",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Column(
                children: [
                  Switch(
                    value: state.isDark,
                    onChanged: (value) {
                      context.read<AppThemeCubit>().toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
