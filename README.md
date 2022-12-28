# Poker Seating Trainer

## Run code generation:

```fvm flutter packages pub run build_runner build --delete-conflicting-outputs```

## Run localization keys generator

```fvm flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations -O lib/src/presentation/features/app_resources```

## Run application

To run application with DEV configuration you need to execute:
`fvm flutter run --dart-define=ENV=dev`