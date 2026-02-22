import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool? obscureText;
  const CustomTextFormField({super.key,required this.hintText,
    required this.labelText,required this.keyboardType,this.inputFormatters,
    this.onChanged,this.maxLength,this.validator,this.obscureText
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
    final OutlineInputBorder _border=OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26),
    borderRadius: BorderRadius.circular(10)
  );
    final OutlineInputBorder _errorBorder=OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10)
    );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:widget.maxLength,
      obscureText: widget.obscureText??false,
      inputFormatters:widget.inputFormatters ,
     onChanged:widget.onChanged ,
     keyboardType:widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        counterText: "",
        border:_border ,
        focusedErrorBorder: _errorBorder,
        focusedBorder:_border ,
          errorBorder:_errorBorder ,
          enabledBorder:_border
      ),
    );
  }
}
