import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';

import '../services/update_product.dart';
import '../wedgets/botton categort.dart';
import '../wedgets/textfeldcategory.dart';
class UpdateProductPadge extends StatefulWidget {
   UpdateProductPadge({super.key});
     static String id='updatePadge';

  @override
  State<UpdateProductPadge> createState() => _UpdateProductPadgeState();
}

class _UpdateProductPadgeState extends State<UpdateProductPadge> {
     String? des
     ,title,image,price;
     bool isloding= false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloding,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle:true ,
          title: const Text('update product',style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),

                Textfaildcatogry(
                onchange: (data){
                    title=data;
                },
                  hint: 'product name',),
                const SizedBox(height: 15,),
                Textfaildcatogry(hint: 'description',
                  onchange: (data){
                    des=data;
                  },
                ),
                const SizedBox(height: 15,),
                Textfaildcatogry(hint: 'price',
                  textInputType: TextInputType.number,
                  onchange: (data){
                    price=data;
                  },
                ),
                const SizedBox(height: 15,),
                Textfaildcatogry(hint: 'image',
                  onchange: (data){
                    image=data;
                  },
                ),

                const SizedBox(height: 30,),
                category_bottom(text: 'Update',
                  ontap: ()async{
                  isloding=true;
                  setState(() {

                  });
                    try {
                      await UpdateProduct(product);
                      print('success');
 
                    } catch (e) {
                      print(e.toString());
                    }
                    isloding = false;
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
     Future<void> UpdateProduct(ProductModel product) async {
       await UpdateProductService().UpdateProduct(
           title: title == null ? product.title : title!,
           price: price == null ? product.price.toString() : price!,
           description: des == null ? product.description : des!,
           image: image == null ? product.image : image!,
           category: product.category,);
     }
}
