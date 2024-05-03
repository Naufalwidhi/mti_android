import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isObscure;
  final Widget? suffixWidget;
  final BoxConstraints? suffixConstraints;
  final TextInputType? inputType;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onChanged;
  final ValueChanged<PointerDownEvent>? onTapOutside;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int maxLines;

  const DefaultTextField({
    super.key,
    required this.controller,
    required this.isObscure,
    required this.hintText,
    this.suffixWidget,
    this.suffixConstraints,
    this.inputType,
    this.onChanged,
    this.onTapOutside,
    this.validator,
    this.onSaved,
    this.maxLength,
    this.maxLines = 1,
  });

  List<TextInputFormatter> get inputFormatters {
    List<TextInputFormatter> formatters = <TextInputFormatter>[];
    switch (inputType?.index) {
      case 2:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 3:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(" ")));
        break;
      case 9:
        break;
    }
    return formatters;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onChanged: onChanged ?? (value) {},
      controller: controller,
      cursorColor: const Color(0xff1FA0C9),
      obscureText: isObscure,
      validator: validator,
      onSaved: onSaved ?? (value) {},
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(fontSize: 15),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff1FA0C9)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff1FA0C9)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff1FA0C9)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        suffixIcon: suffixWidget,
        suffixIconConstraints: suffixConstraints,
      ),
      style: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
