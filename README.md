# A Completed Functional Flutter App - Yope (BLoC Pattern + Json API + Firebase Auth)

<!-- banner hear -->
<!-- ![Banner](https://raw.githubusercontent.com/KhoaSuperman/findseat/apply_bloc/sample_data/github_screenshots/YoutubeBanner_v2_medium.png) -->

## I. Introduction

Yope (Your pet) is a social networking service for sharing photos and videos of pet lovers

The first version of project (v1.0) is just about simple feature of social networking. I applied BloC pattern by using Flutter Bloc to project . I get API support from 200lab.io, so most of the features are interacted with real data returned from the server.

[Check Video Demo](https://youtu.be/cxUiyI4h2Ug)

## II. Showcase

Content coming soon

## III. API

Use APIs supported by 200lab.io , dofhunt:
https://api.dofhunt.200lab.io

## IV. Plugins

| Plugin                                                                   | Usage                                                                                    |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | --- |
| [json_serializable](https://pub.dev/packages/json_serializable)          | To generate to/from JSON code for a class (API JSON response)                            |
| [json_annotation](https://pub.dev/packages/json_annotation#-readme-tab-) | Same as above (SAA)                                                                      |
| [build_runner](http://build_runner)                                      | SAA                                                                                      |
| [dio](https://pub.dev/packages/dio)                                      | Method working with API                                                                  |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc)                    | Build app architecture, to implement the BLoC (Business Logic Component) design pattern. |
| [carousel_slider](https://pub.dev/packages/carousel_slider#-readme-tab-) | Custom Image Slider show in post                                                         |
| [shared_preferences](https://pub.dev/packages/shared_preferences)        | Store some simple data to local storage                                                  |
| [image_picker](https://pub.dev/packages/image_picker)                    | Get photo to create new post feature                                                     |
| [firebase_core](https://pub.dev/packages/firebase_core)                  | Register account (google account) and login using Firebase                               |
| [google_sign_in](https://pub.dev/packages/google_sign_in)                | SAA                                                                                      |
| [firebase_auth](https://pub.dev/packages/firebase_auth)                  | SAA                                                                                      |     |

## Development Environment

`flutter doctor -v`

```
[✓] Flutter (Channel stable, 3.3.0, on macOS 12.5.1 21G83 darwin-arm, locale en-VN)
    • Flutter version 3.3.0 on channel stable at /Users/khanhdaoba/Code/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision ffccd96b62 (12 days ago), 2022-08-29 17:28:57 -0700
    • Engine revision 5e9e0e0aa8
    • Dart version 2.18.0
    • DevTools version 2.15.0

[✓] Android toolchain - develop for Android devices (Android SDK version 32.1.0-rc1)
    • Android SDK at /Users/khanhdaoba/Library/Android/sdk
    • Platform android-32, build-tools 32.1.0-rc1
    • ANDROID_SDK_ROOT = /Users/khanhdaoba/Library/Android/sdk
    • Java binary at: /Applications/Android Studio.app/Contents/jre/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.12+0-b1504.28-7817840)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 13.4.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 13F100
    • CocoaPods version 1.11.3

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2021.2)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.12+0-b1504.28-7817840)

[✓] VS Code (version 1.71.0)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.48.0

[✓] Connected device (2 available)
    • macOS (desktop) • macos  • darwin-arm64   • macOS 12.5.1 21G83 darwin-arm
    • Chrome (web)    • chrome • web-javascript • Google Chrome 105.0.5195.102

[✓] HTTP Host Availability
    • All required HTTP hosts are available

• No issues found!

```

Before run project, execute commands:

- `flutter clean`
- `flutter pub get`
- `flutter pub run build_runner build` or `flutter pub run build_runner build --delete-conflicting-outputs`
- `flutter run` (if needed)

## Support

- If you wanna get updates in next version, please give me a ⭐ to the repo 👍
- If you love my work and want to support, [buy me a coffee here](https://www.facebook.com/daokhanh1102/). Thank you so much 👍
