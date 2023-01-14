import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeSource {
  static const Color darkBlueColor = Color(0xff05314E);

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
    );
  }
}
