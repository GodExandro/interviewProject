import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppSpacing extends Equatable {
  const AppSpacing({
    required this.small,
    required this.semiSmall,
    required this.regular,
    required this.medium,
    required this.semiBig,
    required this.big,
  });

  factory AppSpacing.regular() => const AppSpacing(
        small: 4,
        semiSmall: 8,
        regular: 12,
        medium: 16,
        semiBig: 22,
        big: 32,
      );

  final double small;
  final double semiSmall;
  final double regular;
  final double medium;
  final double semiBig;
  final double big;

  AppEdgeInsetsSpacingData asInsets() => AppEdgeInsetsSpacingData(this);

  @override
  List<Object?> get props => [
        small,
        semiSmall,
        regular,
        medium,
        semiBig,
        big,
      ];
}

class AppEdgeInsetsSpacingData extends Equatable {
  const AppEdgeInsetsSpacingData(this._spacing);

  EdgeInsets get small => EdgeInsets.all(_spacing.small);
  EdgeInsets get semiSmall => EdgeInsets.all(_spacing.semiSmall);
  EdgeInsets get regular => EdgeInsets.all(_spacing.regular);
  EdgeInsets get medium => EdgeInsets.all(_spacing.medium);
  EdgeInsets get semiBig => EdgeInsets.all(_spacing.semiBig);
  EdgeInsets get big => EdgeInsets.all(_spacing.big);

  final AppSpacing _spacing;

  @override
  List<Object?> get props => [_spacing];
}
