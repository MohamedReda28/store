
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:store_app/helpes/Api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategoryService{
  Future<List<ProductModel>> GetCategory({required String category_name}) async{
 List<dynamic> data  = await Api().Get(url: 'https://fakestoreapi.com/products/categories/$category_name');
  List<ProductModel> listproduct=[];
  for(int i=0;i<data.length;i++){
    listproduct.add(ProductModel.fromJson(data[i]));
  }
  return listproduct;

  }
}