import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:store_app/helpes/Api.dart';

import '../models/product_model.dart';
class AllProductService{
  
  Future<List<ProductModel>> GetAllProduct() async {
    List<dynamic> data= await Api().Get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> listproduct =[];
   for(int i=0;i<data.length;i++)
   {

     listproduct.add(ProductModel.fromJson(data[i]));

   }

   return listproduct;
 }

}