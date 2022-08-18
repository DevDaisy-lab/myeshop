import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color = Colors.white,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textStyle6 = Theme.of(context).textTheme.headline6;
    final textColor = Theme.of(context).colorScheme.secondary;
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: textColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: textStyle6,
            ),
          ),
        )
      ],
    );
  }
}
