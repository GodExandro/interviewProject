import 'package:flutter/material.dart';
import 'package:interview_application/l10n/l10n_extension.dart';
import 'package:interview_application/src/domain/domain.dart';
import 'package:interview_application/src/widgets/custom_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:interview_application/src/theme/theme.dart' as custom_theme;

class DetailedPage extends StatelessWidget {
  final DataModel dataModel;
  const DetailedPage({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    String getDescriptionWithouthUrl(String descriptionUrl) {
      final start = descriptionUrl.lastIndexOf('\t');
      if (start != -1) {
        return descriptionUrl.substring(start + 1);
      }

      return '';
    }

    final doesUrlExist = dataModel.description.lastIndexOf('\t') != -1;
    final l10n = context.l10n;
    final theme = custom_theme.Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.browserAppbarTitle),
        backgroundColor: theme.colorScheme.backgroundColor,
      ),
      body: doesUrlExist
          ? WebViewWidget(
              controller: WebViewController()
                ..loadRequest(
                  Uri.parse(getDescriptionWithouthUrl(dataModel.description)),
                ),
            )
          : Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(l10n.failedToOpenWebView),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                      text: l10n.returnButtonText,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
              ],
            ),
    );
  }
}
