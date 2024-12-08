import 'package:flutter/material.dart';
class Textfaildcatogry extends StatelessWidget {
  Textfaildcatogry({required this.hint,this.onchange,this.textInputType});
  String hint;
  Function(String)? onchange;
  Function(String)? valid;
  TextInputType? textInputType;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (data){
          if(data!.isEmpty){
            return 'field is required';

          }
        },
        style: TextStyle(color: Colors.white),
        onChanged: onchange,
         keyboardType:textInputType ,
        decoration: InputDecoration(
            hintText:hint ,
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(8),


            )
        ),
      ),
    );
  }
}
