import 'package:flutter/material.dart';
import 'package:interview_application/l10n/l10n_extension.dart';
import 'package:interview_application/src/theme/themes.dart' as custom_theme;

class DataCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String lastModificated;
  final VoidCallback onTap;
  const DataCard(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.lastModificated,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    String getDescriptionWithouthUrl(String description) {
      final endIndex = description.lastIndexOf('\t');
      return description.substring(0, endIndex);
    }

    final lastModificatedDateTime = DateTime.parse(lastModificated);
    final l10n = context.l10n;
    final theme = custom_theme.Theme.of(context);
    final textStyle = TextStyle(color: theme.colorScheme.textColor);

    return Padding(
      padding: EdgeInsets.all(
        theme.spacing.medium,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.backgroundCardColor,
            borderRadius: BorderRadius.circular(
              theme.spacing.semiSmall,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              theme.spacing.semiSmall,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: textStyle.copyWith(
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: theme.spacing.semiSmall,
                        ),
                        Text(
                          getDescriptionWithouthUrl(description),
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  //Spacer(),
                  SizedBox(
                    width: theme.spacing.semiSmall,
                  ),
                  Image.network(
                    imageUrl,
                    height: 120,
                  ),
                ],
              ),
              SizedBox(
                height: theme.spacing.semiSmall,
              ),
              Text(
                '${l10n.lastModified}: ${lastModificatedDateTime.day.toString().padLeft(2, "0")}.${lastModificatedDateTime.month.toString().padLeft(2, "0")}.${lastModificatedDateTime.year}',
                style: textStyle,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
