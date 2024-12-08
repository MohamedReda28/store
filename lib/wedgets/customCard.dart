import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import '../screens/update proudct padge.dart';
class CustemCard  extends StatelessWidget {
   CustemCard ({ required this.product});
  ProductModel product ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPadge.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  ),
                ]
            ),
            child:
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0, 6),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price.toString()}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight:FontWeight.bold
                          ),
                        ),
                        const Icon(Icons.favorite,color: Colors.red,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 68,
              top: -60,
              child: Image.network(product.image,height: 100,width: 100,)),
        ],
      ),
    );
  }
}
