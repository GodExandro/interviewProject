import 'package:equatable/equatable.dart';
import 'package:interview_application/src/theme/theme.dart';

class ThemeData extends Equatable {
  const ThemeData({
    required this.colorScheme,
    required this.spacing,
  });

  factory ThemeData.light() => ThemeData(
        colorScheme: ColorScheme.light(),
        spacing: AppSpacing.regular(),
      );

  factory ThemeData.dark() => ThemeData(
        colorScheme: ColorScheme.dark(),
        spacing: AppSpacing.regular(),
      );

  final ColorScheme colorScheme;
  final AppSpacing spacing;

  @override
  List<Object?> get props => [
        colorScheme,
        spacing,
      ];
}
