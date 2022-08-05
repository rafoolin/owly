import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpandableText extends HookWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);
    final maxLines = expanded.value ? null : 4;
    final overflow = expanded.value ? null : TextOverflow.ellipsis;

    return Column(
      children: [
        Text(
          text,
          maxLines: maxLines,
          textAlign: TextAlign.justify,
          overflow: overflow,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              expanded.value = !expanded.value;
            },
            child: Text(expanded.value ? 'Show less' : 'Show more'),
          ),
        ),
      ],
    );
  }
}
