import 'package:flutter/material.dart';
import 'package:store_app/screens/HomePadge.dart';
import 'package:store_app/screens/update%20proudct%20padge.dart';

void main(){
  runApp(StoreApp());
}
class StoreApp extends StatelessWidget {
  StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePadge.id:(context)=>HomePadge(),
        UpdateProductPadge.id:(context)=>UpdateProductPadge(),
      },
    initialRoute: HomePadge.id,
    );
  }
}
