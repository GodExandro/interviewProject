import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorScheme extends Equatable {
  const ColorScheme({
    required this.primaryColor,
    required this.textColor,
    required this.backgroundColor,
    required this.buttonTextColor,
    required this.backgroundCardColor,
  });

  factory ColorScheme.light() => const ColorScheme(
        primaryColor: Colors.blue,
        textColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 68, 109, 143),
        buttonTextColor: Colors.white,
        backgroundCardColor: Color.fromARGB(255, 134, 169, 197),
      );

  factory ColorScheme.dark() => const ColorScheme(
        primaryColor: Color.fromARGB(255, 46, 43, 43),
        textColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 68, 64, 64),
        buttonTextColor: Colors.white,
        backgroundCardColor: Color.fromARGB(255, 121, 125, 128),
      );

  final Color primaryColor;
  final Color textColor;
  final Color backgroundColor;
  final Color buttonTextColor;
  final Color backgroundCardColor;
  @override
  List<Object?> get props => [
        primaryColor,
        textColor,
        backgroundColor,
        buttonTextColor,
        backgroundCardColor,
      ];
}
