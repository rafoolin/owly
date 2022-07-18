import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 40.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
      child: Text(text),
    );
  }
}
