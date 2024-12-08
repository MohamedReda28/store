import '../helpes/Api.dart';
import '../models/product_model.dart';

class UpdateProductService
{
  Future<ProductModel> UpdateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  })async
  {
    Map<String,dynamic> data= await Api().Put(
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