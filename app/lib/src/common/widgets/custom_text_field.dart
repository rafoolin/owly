import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/action_debounce.dart';

class CustomTextField extends HookConsumerWidget {
  final void Function(String)? onChanged;
  final bool autocorrect;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final bool enableSuggestions;
  final TextInputType? keyboardType;

  /// Wether show suffix visibility icon or not.
  ///
  /// If true, you have to pass the [toggleObscurePassword] as well.
  final bool showVisibilitySuffixIcon;
  final VoidCallback? toggleObscurePassword;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.toggleObscurePassword,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.showVisibilitySuffixIcon = false,
  })  : assert(
          showVisibilitySuffixIcon ^ (toggleObscurePassword == null),
          'Both conditions are true or false at the same time',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debounce = useMemoized(() => ActionDebounce());

    return TextFormField(
      autocorrect: autocorrect,
      obscureText: obscureText,
      keyboardType: keyboardType,
      enableSuggestions: enableSuggestions,
      onChanged: onChanged == null
          ? null
          : (text) => debounce.run(() => onChanged!(text)),
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        border: const OutlineInputBorder(),
        suffixIcon: !showVisibilitySuffixIcon
            ? null
            : IconButton(
                onPressed: toggleObscurePassword,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: obscureText ? Colors.grey : Colors.black,
                ),
              ),
      ),
    );
  }
}
