import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://accessories-eshop.runasp.net/api/",
    )
    );
  
   Future<Map<String, dynamic>> product()
  async {
    try{final response = await dio.get(
      "products", 
      
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        return response.data as Map<String, dynamic>;
      } else {
        log(response.statusMessage.toString());
        return{} ;
      }
      } on DioException catch (e) {
        log (e.message ?? "");
        return {};
      }

  }
}