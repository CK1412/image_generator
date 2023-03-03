# Image Generator

**Image Generator** that allows create realistic images and art from a description in natural language.

Image Generator is live at [Here](https://ck1412.github.io/image_generator/)

**Note**: Since the Dall E API charges on-demand, image generation will not be available in these builds. Use your API_KEY and it should work fine.

## Project Information

- Support platform: Web, Windows, Android.
- Technology:
    - Flutter v3.7.3
    - Dart v2.17.5
- API: [DALL-E OpenAI](https://platform.openai.com/docs/api-reference/images/create)

## Screenshots

| For Web  | For App |
|---|---|
| ![screenshot_web_on_desktop](screenshots/screenshot_web_on_desktop.png)  | ![screenshot_app_on_mobile](screenshots/screenshot_app_on_mobile.png)  |

## Github

https://github.com/CK1412/image_generator

## How to run Project

> Assuming you already have a runtime environment for Flutter

- Clone this project and open with Visual Studio Code.

- Create a file named .env in the root of your project and add the following line to store your API key:

    ```env
    API_KEY=[YOUR_API_KEY]   
    ```
> The commands below will be run on Terminal of VSCode.

- To install dependences, run: `flutter pub get`

- Run code-generators: `flutter packages pub run build_runner build --delete-conflicting-outputs`

> I have configured for two environments: development and production. Here ?> are the running instructions for the development environment.

- Now, run the project: `flutter run --flavor development --target lib/main/main_development.dart`

- Alternatively you can run it manually.

## How to Build and Release 

- [Build and release an Android App](https://docs.flutter.dev/deployment/android)

- [Build and release an Web App](https://docs.flutter.dev/deployment/web)

- [Build and release an Windows App](https://docs.flutter.dev/deployment/windows)

## License

[MIT License](LICENSE)
    