import 'package:flutter/material.dart';

import '../../core/constants/text_styles/text_style_constants.dart';
import '../../core/exports/constants_exports.dart';

class SearchInput extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final Function() onTap;

  const SearchInput({
    Key? key,
    required this.focusNode,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Word',
        hintStyle: TextStyleConstants.regularStyle(
          fontSize: context.width*0.04,
          color: ColorConstants.darkGrey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0),
        ),
        fillColor: ColorConstants.white,
        contentPadding: EdgeInsets.symmetric(
          vertical: context.height * 0.01,
          horizontal: context.width * 0.04,
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: const Icon(Icons.close),
        ),
      ),
    );
  }
}
