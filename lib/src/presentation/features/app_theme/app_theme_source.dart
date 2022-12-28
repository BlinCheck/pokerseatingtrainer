import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeSource {
  static const Color darkBackgroundColor = Color(0xff00263F);
  static const Color lightBackgroundColor = Color(0xffF1F3F5);
  static const Color darkBlueColor = Color(0xff05314E);
  static const Color lightBlueColor = Color(0xff38CEEE);
  static const Color greyBlueColor = Color(0xff7192A8);
  static const Color buttonGreyBorderColor = Color(0xff749DB8);
  static const Color buttonDarkTextColor = Color(0xff032B45);
  static const Color errorColor = Color(0xffff5757);
  static const Color textColor = Color(0xff303030);

  ThemeData get theme => ThemeData.light().copyWith(
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        iconTheme: _iconThemeData,
        cupertinoOverrideTheme:
            const CupertinoThemeData(brightness: Brightness.light),
      );

  AppBarTheme get _appBarTheme {
    return const AppBarTheme().copyWith(
      centerTitle: true,
      titleTextStyle: _textTheme.headline1,
      toolbarTextStyle: _textTheme.bodyText2,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: _iconThemeData,
      systemOverlayStyle: _systemUiOverlayStyle,
    );
  }

  SystemUiOverlayStyle get _systemUiOverlayStyle {
    return const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    );
  }

  IconThemeData get _iconThemeData {
    return const IconThemeData().copyWith(
      color: darkBlueColor,
      size: 18,
    );
  }

  TextTheme get _textTheme {
    return const TextTheme().copyWith(
      headline1: const TextStyle(
        fontSize: 17,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: darkBlueColor,
      ),
      headline2: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: errorColor,
        letterSpacing: 1,
      ),
      headline3: const TextStyle(
        fontSize: 18,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: darkBlueColor,
      ),
      headline4: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: darkBlueColor,
      ),
      bodyText1: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: darkBlueColor,
      ),
      bodyText2: const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        color: darkBlueColor,
        letterSpacing: 1,
      ),
    );
  }
}
