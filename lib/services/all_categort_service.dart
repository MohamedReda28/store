import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:store_app/helpes/Api.dart';

class AllCategortService{
  
  Future<List<dynamic>> GetAllCategort()async{
    List<dynamic> data= await Api().Get(url: 'https://fakestoreapi.com/products/categories');
    return data;

  }
}