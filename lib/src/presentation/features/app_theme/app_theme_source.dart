import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeSource {
  static const Color darkBlueColor = Color(0xff05314E);
  static const Color lightBlueColor = Color(0xff38CEEE);
  static const Color greyBlueColor = Color(0xff7192A8);
  static const Color buttonDarkTextColor = Color(0xff032B45);
  static const Color backgroundColor = Color(0xffEDF3F5);

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
        fontWeight: FontWeight.w700,
        color: Colors.red,
      ),
      headline2: const TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        color: Colors.white,
      ),
      bodyText1: const TextStyle(
        fontSize: 20,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        color: buttonDarkTextColor,
      )
    );
  }
}
