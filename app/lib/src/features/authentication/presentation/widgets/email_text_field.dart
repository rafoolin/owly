import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? errorText;

  const EmailTextField({
    Key? key,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField.form(
      hintText: 'Email',
      autocorrect: false,
      errorText: errorText,
      onChanged: onChanged,
      enableSuggestions: false,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
