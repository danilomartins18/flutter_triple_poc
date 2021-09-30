import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class TextBox extends StatelessWidget {
  final Key? key;
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final Color? colorTheme;
  final Color? colorText;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool disabled;

  TextBox({
    this.key,
    this.controller,
    this.initialValue,
    this.label,
    this.colorTheme,
    this.colorText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines,
    this.focusNode,
    this.maxLength,
    this.disabled = false,
  }) : super(key: key);

  InputDecoration _buildDecoration() {
    return InputDecoration(
      labelText: this.label,
      labelStyle: TextStyle(
        fontFamily: kDefaultFont,
        color: colorTheme ?? kPrimaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _fieldStyle = TextStyle(
      color: colorText ?? Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    final _fieldDisableStyle = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);

    return disabled
        ? FocusScope(
            node: new FocusScopeNode(),
            child: TextFormField(
              key: this.key,
              controller: this.controller,
              initialValue: this.initialValue,
              style: _fieldDisableStyle,
              decoration: _buildDecoration(),
              onChanged: this.onChanged,
              onSaved: this.onSaved,
              validator: this.validator,
              inputFormatters: this.inputFormatters,
              keyboardType: this.keyboardType,
              obscureText: this.obscureText ?? false,
              textInputAction: this.textInputAction,
              onFieldSubmitted: onFieldSubmitted,
              maxLines: maxLines ?? 1,
              focusNode: focusNode,
              maxLength: maxLength,
            ),
          )
        : TextFormField(
            key: this.key,
            controller: this.controller,
            initialValue: this.initialValue,
            style: _fieldStyle,
            decoration: _buildDecoration(),
            onChanged: this.onChanged,
            onSaved: this.onSaved,
            validator: this.validator,
            inputFormatters: this.inputFormatters,
            keyboardType: this.keyboardType,
            obscureText: this.obscureText ?? false,
            textInputAction: this.textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines ?? 1,
            focusNode: focusNode,
            maxLength: maxLength,
          );
  }
}
