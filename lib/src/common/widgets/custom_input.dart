import 'package:flutter/material.dart';

import '../../core/exports/constants_exports.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value!.isEmpty == true){
          return 'This field can not be empty';
        }return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyleConstants.regularStyle(
          fontSize: 14,
          color: ColorConstants.darkGrey,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: context.height * 0.014,
          horizontal: context.width * 0.03,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
