import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

import '../services/get_all_products.dart';
import '../wedgets/customCard.dart';
class HomePadge extends StatefulWidget {
  const HomePadge({super.key});
  static String id ='HomePadge';

  @override
  State<HomePadge> createState() => _HomePadgeState();
}

class _HomePadgeState extends State<HomePadge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('New Trend'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(FontAwesomeIcons.cartShopping)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,top: 70),
        child:FutureBuilder<List<ProductModel>>(
          future: AllProductService().GetAllProduct(),
          builder: ( BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemCount:products.length ,
                  itemBuilder: (context,index){
                    return CustemCard(product: products[index],);
                  }
              );
            }else{
              return  Center(child: CircularProgressIndicator(),);
            }

          }
        ),

      ),
    );
  }
}
