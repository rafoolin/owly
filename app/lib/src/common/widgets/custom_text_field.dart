import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/authentication/presentation/sign_in_view.dart';
import '../../features/profile/presentation/edit_profile_view.dart';
import '../../utils/action_debounce.dart';

class CustomTextField extends HookConsumerWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool? filled;
  final Color? fillColor;
  final bool autocorrect;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final InputBorder? border;
  final bool enableSuggestions;
  final TextInputType? keyboardType;
  final EdgeInsets? contentPadding;

  /// Wether show suffix visibility icon or not.
  ///
  /// If true, you have to pass the [toggleObscurePassword] as well.
  final bool showVisibilitySuffixIcon;
  final VoidCallback? toggleObscurePassword;
  const CustomTextField({
    Key? key,
    this.border,
    this.filled,
    this.hintText,
    this.fillColor,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.contentPadding,
    this.controller,
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

  /// A type of [TextField] used in forms.
  ///
  /// Like in [EditProfileView] or [SignInView] and etc.
  factory CustomTextField.form({
    TextEditingController? controller,
    void Function(String)? onChanged,
    bool? filled,
    Color? fillColor,
    String? hintText,
    String? errorText,
    InputBorder? border,
    TextInputType? keyboardType,
    EdgeInsets? contentPadding,
    VoidCallback? toggleObscurePassword,
    bool autocorrect = true,
    bool obscureText = false,
    bool enableSuggestions = true,
    bool showVisibilitySuffixIcon = false,
  }) =>
      CustomTextField(
        controller: controller,
        onChanged: onChanged,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
          gapPadding: 0.0,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        errorText: errorText,
        hintText: hintText,
        keyboardType: keyboardType,
        obscureText: obscureText,
        toggleObscurePassword: toggleObscurePassword,
        showVisibilitySuffixIcon: showVisibilitySuffixIcon,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debounce = useMemoized(() => ActionDebounce());

    return TextFormField(
      controller: controller,
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
        border: border,
        contentPadding: contentPadding,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        fillColor: fillColor,
        filled: filled,
        suffixIcon: !showVisibilitySuffixIcon
            ? null
            : IconButton(
                splashColor: Colors.transparent,
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
