import 'package:flutter/material.dart';

class BorderedInputLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const BorderedInputLabel({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(.50),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: child,
        ),
      ],
    );
  }
}
