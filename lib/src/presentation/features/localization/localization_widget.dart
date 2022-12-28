import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const _supportedLocales = [Locale('en')];

class LocalizationWidget extends StatefulWidget {
  const LocalizationWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _LocalizationWidgetState createState() => _LocalizationWidgetState();
}

class _LocalizationWidgetState extends State<LocalizationWidget> {
  final _localizationLibraryInitializedNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _initLanguage();
  }

  Future<void> _initLanguage() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    _localizationLibraryInitializedNotifier.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _localizationLibraryInitializedNotifier,
      builder: (c, value, snapshot) => value == true
          ? EasyLocalization(
              supportedLocales: _supportedLocales,
              path: 'assets/translations',
              fallbackLocale: _supportedLocales.first,
              child: widget.child,
            )
          : const SizedBox(),
    );
  }
}
