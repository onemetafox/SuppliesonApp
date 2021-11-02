import 'package:customer_end/utils/app_colors.dart';
import 'package:customer_end/utils/widget_dimensions.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final Widget suffixIcon;
  final Key key;
  final String errorText;
  final Function onChanged;
  final FocusNode focusNode;
  final String initialValue;
  final String hintText;
  final double textFieldHeight;
final TextEditingController controller ;
  FormInput({
    @required this.label,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.key,
    this.controller ,
    this.errorText,
    @required this.onChanged,
    @required this.focusNode,
    this.initialValue,
    this.hintText,
    this.textFieldHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimensions.pixels_16),
          ),
        ),
        SizedBox(
          height: Dimensions.pixels_5,
        ),
        TextFormField(
          focusNode: focusNode,
          controller:  controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: primaryColor.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.pixels_10),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: textFieldHeight, horizontal: Dimensions.pixels_10),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            errorMaxLines: 3,
            hintText: hintText,
          ),
          style: TextStyle(fontSize: Dimensions.pixels_18, letterSpacing: 0.7),
          obscureText: obscureText,
          keyboardType: keyboardType,
          key: key,
          onChanged: onChanged,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
