import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({required this.onPressed, required this.child, super.key});

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.primaryAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: child,
        ));
  }
}
