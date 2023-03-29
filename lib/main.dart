import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:interview_application/src/theme/theme.dart';
import 'package:interview_application/src/view/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return Theme(
          data: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          child: const material.MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            title: '',
            home: HomePage(),
          ),
        );
      }),
    );
  }
}
