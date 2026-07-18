
import 'package:flutter/material.dart';
import 'package:flutter_application_6/api_service.dart';
import 'package:flutter_application_6/app_theme_cubit.dart';
import 'package:flutter_application_6/app_theme_state.dart';
import 'package:flutter_application_6/loginscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Homepage",
                style: TextStyle(fontSize: 30),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(Icons.settings, size: 30),
                  onPressed: () {},
                ),
              ),
            ],
          ),
            body:SizedBox(
                child: Column(
                  children: [

              FutureBuilder(
              future: ApiService().product(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data?["items"] == null) {
                  return const Center(child: Text("No products found"));
                }

                final items = snapshot.data!["items"];

               return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item["coverPictureUrl"],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(item["description"]),
                                Text("${item["price"]} €", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: Icon(Icons.add_circle_outline, size: 30),
                            onPressed: () {},),
                        ],
                      ),
                    );
                  },
                ),
              );
              })      
                  ],
                ),
              ) ,
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
                              builder: (context) => Loginscreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, 
                      icon: const Icon(Icons.account_circle))
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, 
                      icon: const Icon(Icons.shopping_cart))
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
            ) 
        );
        }
        );
        }
        }