# idt_chat

IDT Test Assignment

![idt_demo](https://user-images.githubusercontent.com/15160049/209794830-d93e0d7d-9676-48cc-b4aa-e919672c8f6c.gif)


### Environment
Dart 2.18.1

Flutter 3.3.2

### To build the app in release mode:
execute this command in the project directory: `flutter build apk --release --dart-define="API_BASE_URL=https://jefe-stg-media-bucket.s3.amazonaws.com/"`

### To run the app in Android Studio: 
add Additional run args: --dart-define="API_BASE_URL=https://jefe-stg-media-bucket.s3.amazonaws.com/"

### To generate models:
execute in the project directory: `flutter packages pub run build_runner build --delete-conflicting-outputs`

### To generate localization files:
execute in the project directory: `fvm flutter gen-l10n`

