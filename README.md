# Enable Collector App
This app is made using Flutter by Google.

## Installation

1. Install Flutter using [this](https://flutter.dev/docs/get-started/install) link. Follow the complete setup guide, run `flutter doctor` to verify your installation.

2. Enable Web support using [this](https://flutter.dev/docs/get-started/web) link. 

3. (Optional) Install Android SDK is building for android.


## Build Flutter App
Once Flutter has been successfully installed, follow these steps to build the Collector App based on custom parameters.

1. Run the following command to build web app.
```shell
flutter build web --dart-define=BASE_URL="<BACKEND_URL>"  --dart-define=GOOGLE_API_KEY="<GOOGLE_API_KEY>" 
```

To build APK, run
```shell
flutter build apk --dart-define=BASE_URL="<BACKEND_URL>"  --dart-define=GOOGLE_API_KEY="<GOOGLE_API_KEY>" 
```

Note: The two parameters defined using `--dart-define` are environment variables which need to be set according to the deployment.

2. Once built, the complied code can be found inside the build folder. build/web contains the web app and build/app contains the android/ios app.

## Web Deployment

1. Simply take the code from build/web and serve is using a web server like nginx or apache.




