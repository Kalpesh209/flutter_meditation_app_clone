import 'package:flutter/material.dart';

class RectangleButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const RectangleButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
