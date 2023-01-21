import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_theme/app_theme_source.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/transparent_inkwell.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.text,
    this.onPressed,
    this.color = AppThemeSource.lightBlueColor,
    this.disabledColor = AppThemeSource.greyBlueColor,
    this.borderColor = AppThemeSource.lightBlueColor,
    this.textColor = AppThemeSource.buttonDarkTextColor,
    this.disabledTextColor = Colors.white,
    this.disabled = false,
    this.showLoader = false,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color disabledColor;
  final Color borderColor;
  final Color textColor;
  final Color disabledTextColor;
  final bool disabled;
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return TransparentInkWell(
      onTap: !disabled ? onPressed : null,
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(38)),
          color: !disabled ? color : disabledColor,
          border: Border.all(color: !disabled ? borderColor : disabledColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: showLoader
              ? _buildLoader(context)
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: disabled ? disabledTextColor : textColor,
                      ),
                ),
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(brightness: Brightness.light),
      child: const CupertinoActivityIndicator(),
    );
  }
}
