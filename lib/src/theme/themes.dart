import 'package:flutter/widgets.dart';
import 'package:interview_application/src/theme/theme.dart';

class Theme extends InheritedWidget {
  const Theme({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  final ThemeData data;

  static ThemeData of(BuildContext context) {
    final inheritedTheme = context.dependOnInheritedWidgetOfExactType<Theme>();
    final theme = inheritedTheme!.data;
    return theme;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) {
    return data != oldWidget.data;
  }
}

ThemeData themeOf(BuildContext context) => Theme.of(context);
