import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff66558e),
      surfaceTint: Color(0xff66558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffeaddff),
      onPrimaryContainer: Color(0xff4e3d75),
      secondary: Color(0xff006b5f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9ff2e2),
      onSecondaryContainer: Color(0xff005047),
      tertiary: Color(0xff006877),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa3eeff),
      onTertiaryContainer: Color(0xff004e5a),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1b20),
      onSurfaceVariant: Color(0xff49454e),
      outline: Color(0xff7a757f),
      outlineVariant: Color(0xffcbc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff220f46),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff4e3d75),
      secondaryFixed: Color(0xff9ff2e2),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff83d5c6),
      onSecondaryFixedVariant: Color(0xff005047),
      tertiaryFixed: Color(0xffa3eeff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff83d2e4),
      onTertiaryFixedVariant: Color(0xff004e5a),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffece6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3d2c63),
      surfaceTint: Color(0xff66558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff75639e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003e36),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff1f7a6d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003c46),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1b7787),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff121016),
      onSurfaceVariant: Color(0xff38353d),
      outline: Color(0xff55515a),
      outlineVariant: Color(0xff706b75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xff75639e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c4b84),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff1f7a6d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006055),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1b7787),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005e6b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcac5cc),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xffece6ee),
      surfaceContainerHigh: Color(0xffe1dbe3),
      surfaceContainerHighest: Color(0xffd5d0d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff332258),
      surfaceTint: Color(0xff66558e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff513f77),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00332c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005349),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003139),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00515d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2e2b33),
      outlineVariant: Color(0xff4b4851),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd1bcfd),
      primaryFixed: Color(0xff513f77),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff39285f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005349),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a33),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00515d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003841),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbcb7bf),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5eff7),
      surfaceContainer: Color(0xffe7e0e8),
      surfaceContainerHigh: Color(0xffd8d2da),
      surfaceContainerHighest: Color(0xffcac5cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1bcfd),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff37265d),
      primaryContainer: Color(0xff4e3d75),
      onPrimaryContainer: Color(0xffeaddff),
      secondary: Color(0xff83d5c6),
      onSecondary: Color(0xff003731),
      secondaryContainer: Color(0xff005047),
      onSecondaryContainer: Color(0xff9ff2e2),
      tertiary: Color(0xff83d2e4),
      onTertiary: Color(0xff00363f),
      tertiaryContainer: Color(0xff004e5a),
      onTertiaryContainer: Color(0xffa3eeff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff948f99),
      outlineVariant: Color(0xff49454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff66558e),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff220f46),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff4e3d75),
      secondaryFixed: Color(0xff9ff2e2),
      onSecondaryFixed: Color(0xff00201c),
      secondaryFixedDim: Color(0xff83d5c6),
      onSecondaryFixedVariant: Color(0xff005047),
      tertiaryFixed: Color(0xffa3eeff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff83d2e4),
      onTertiaryFixedVariant: Color(0xff004e5a),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2b292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4d6ff),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff2c1b51),
      primaryContainer: Color(0xff9a87c4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff98ecdc),
      onSecondary: Color(0xff002b26),
      secondaryContainer: Color(0xff4b9e91),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff99e9fa),
      onTertiary: Color(0xff002a31),
      tertiaryContainer: Color(0xff4a9cac),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe1dae5),
      outline: Color(0xffb6b0ba),
      outlineVariant: Color(0xff948e99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff4f3e76),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff17033c),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff3d2c63),
      secondaryFixed: Color(0xff9ff2e2),
      onSecondaryFixed: Color(0xff001511),
      secondaryFixedDim: Color(0xff83d5c6),
      onSecondaryFixedVariant: Color(0xff003e36),
      tertiaryFixed: Color(0xffa3eeff),
      onTertiaryFixed: Color(0xff001418),
      tertiaryFixedDim: Color(0xff83d2e4),
      onTertiaryFixedVariant: Color(0xff003c46),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff46434a),
      surfaceContainerLowest: Color(0xff08070b),
      surfaceContainerLow: Color(0xff1f1d22),
      surfaceContainer: Color(0xff29272d),
      surfaceContainerHigh: Color(0xff343138),
      surfaceContainerHighest: Color(0xff3f3c43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff6ecff),
      surfaceTint: Color(0xffd1bcfd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffcdb8f9),
      onPrimaryContainer: Color(0xff100032),
      secondary: Color(0xffb0fff0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff7fd1c3),
      onSecondaryContainer: Color(0xff000e0b),
      tertiary: Color(0xffd2f6ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7fcee0),
      onTertiaryContainer: Color(0xff000d11),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff5edf9),
      outlineVariant: Color(0xffc7c0cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff4f3e76),
      primaryFixed: Color(0xffeaddff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd1bcfd),
      onPrimaryFixedVariant: Color(0xff17033c),
      secondaryFixed: Color(0xff9ff2e2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff83d5c6),
      onSecondaryFixedVariant: Color(0xff001511),
      tertiaryFixed: Color(0xffa3eeff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff83d2e4),
      onTertiaryFixedVariant: Color(0xff001418),
      surfaceDim: Color(0xff141218),
      surfaceBright: Color(0xff524f55),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff211f24),
      surfaceContainer: Color(0xff322f35),
      surfaceContainerHigh: Color(0xff3d3a40),
      surfaceContainerHighest: Color(0xff49454c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
