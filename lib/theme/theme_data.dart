import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coteccons_app/shared/shared.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    return ThemeData(
        brightness: brightness,
        canvasColor: background,
        cardColor: background,
        dividerColor: divider,
        dividerTheme: DividerThemeData(
          color: divider,
          space: 1,
          thickness: 1,
        ),
        cardTheme: CardTheme(
          color: cardBackground,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
        primaryColor: accentColor,
        // textSelectionColor: accentColor,
        // textSelectionHandleColor: accentColor,
        // cursorColor: accentColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: accentColor,
          selectionHandleColor: accentColor,
          cursorColor: accentColor,
        ),
        appBarTheme: AppBarTheme(
          color: cardBackground,
          iconTheme: IconThemeData(
            color: secondaryText,
          ),
        ),
        iconTheme: IconThemeData(
          color: secondaryText,
          size: 16.0,
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme(
            brightness: brightness,
            primary: accentColor,
            secondary: accentColor,
            surface: background,
            background: background,
            error: error,
            onPrimary: buttonText,
            onSecondary: buttonText,
            onSurface: buttonText,
            onBackground: buttonText,
            onError: buttonText,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: brightness,
          primaryColor: accentColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: error),
          labelStyle: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: primaryText.withOpacity(0.5),
          ),
          hintStyle: TextStyle(
            color: secondaryText,
            fontSize: 13.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        fontFamily: 'Rubik',
        unselectedWidgetColor: hexToColor('#DADCDD'),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(hexToColor("#01BEB7")))));
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: Colors.white,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: Colors.black,
        secondaryText: Colors.white,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.secondaryAppColor,
        buttonBackground: Colors.black38,
        buttonText: ColorConstants.secondaryAppColor,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.darkScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryDarkAppColor,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: ColorConstants.secondaryDarkAppColor,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: ColorConstants.secondaryDarkAppColor,
        disabled: ColorConstants.secondaryDarkAppColor,
        error: Colors.red,
      );
}
