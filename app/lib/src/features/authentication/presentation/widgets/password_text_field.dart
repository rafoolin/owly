import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final bool obscureText;
  final String? errorText;
  final Function(String) onChanged;
  final VoidCallback toggleObscurePassword;

  const PasswordTextField({
    Key? key,
    required this.onChanged,
    this.errorText,
    required this.toggleObscurePassword,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField.form(
      obscureText: obscureText,
      hintText: 'Password',
      onChanged: onChanged,
      enableSuggestions: false,
      autocorrect: obscureText,
      showVisibilitySuffixIcon: true,
      toggleObscurePassword: toggleObscurePassword,
    );
  }
}
