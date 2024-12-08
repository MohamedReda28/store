import 'package:store_app/helpes/Api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct
{
  Future<ProductModel> Add_Product({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  })async
  {
    Map<String,dynamic> data= await Api().Post(
        url: 'https://fakestoreapi.com/products',
        Body: {
          "title": title,
          "price": price,
          "description": description,
          "image": image,
          "category": category,
        },
    );
    return ProductModel.fromJson(data);
  }
}