import 'package:flutter/material.dart';
import 'package:interview_application/src/theme/themes.dart' as custom_theme;

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = custom_theme.Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(
        theme.spacing.medium,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(theme.colorScheme.primaryColor),
          foregroundColor:
              MaterialStateProperty.all(theme.colorScheme.buttonTextColor),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
