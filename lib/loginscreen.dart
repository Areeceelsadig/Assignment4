import 'package:flutter/material.dart';
import 'package:flutter_application_6/Signupscreen.dart';
import 'package:flutter_application_6/api_service.dart';
import 'package:flutter_application_6/app_theme_cubit.dart';
import 'package:flutter_application_6/app_theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Loginscreen extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final apiservice = ApiService();
  final String? prefilledEmail;

  Loginscreen({super.key, this.prefilledEmail})
      : emailController = TextEditingController(text: prefilledEmail ?? "");
    

  @override
  Widget build(BuildContext context) {
 
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 200,
              titleSpacing: 0,
              title: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/id-middle-class.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            body: Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        Text(
                          "Let's Connect With Us!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),


<<<<<<< HEAD
                      TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
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

                    const SizedBox(height: 20),

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
=======
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ) ,
                            
                            
                          const SizedBox(height: 20),
                            
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 4) {
                                  return 'Password must be at least 4 characters';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ) ,
>>>>>>> 27d6af1 (assignment6)
                      
                      const SizedBox(height: 10),
              
                    Container(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text("Forgot Password?"),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 370,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
<<<<<<< HEAD
                      alignment: AlignmentGeometry.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
=======
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                        context.goNamed("HomeScreen");

                      } else {
                        print('Validation failed');
                        }
                        

                      },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
>>>>>>> 27d6af1 (assignment6)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Signupscreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: state.isDark,
                        onChanged: (value) {
                          context.read<AppThemeCubit>().toggleTheme();
                        },
                      ),
                    ],
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
