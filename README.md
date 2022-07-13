# spotify_clone

A Flutter project for cloning Spotify app. It contains all real call to spotify and remove some 
constraint for mobile app like fixed shuffle cmode

## Getting Started


## Login into spotify 

Go to spotify dashboard (https://developer.spotify.com/dashboard/) and add a nex application
Edit settings and add as redirect URL (com.flexdevit.clonespotify://login-callback/) 
Please don't forget trailing slash
Add as bundle Ids com.flexdevit.clonespotify
### ios
Add in `ios/Runner/Info.plist` 
```xml
<key>CFBundleURLTypes</key>
       <array>
          <dict>
             <key>CFBundleTypeRole</key>
             <string>Editor</string>
             <key>CFBundleURLSchemes</key>
             <array>
                <string>com.auth0.flutterauth</string>
             </array>
          </dict>
       </array>
```
nested in `<dict>`

### Android 
Add in `android/app/build.gradle` 

```
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.flexdevit.spotify_clone"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration.
        minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        manifestPlaceholders += [
                'appAuthRedirectScheme': 'com.flexdevit.clonespotify'
        ]
    }
```
In every file `AndroidManifest.xml`
Add 
```xml
 <queries>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="https" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.APP_BROWSER" />
            <data android:scheme="https" />
        </intent>
    </queries>
```
nested into `<manifest>`

### Starting application
Add as addition args
`--dart-define=AUTH0_DOMAIN=accounts.spotify.com --dart-define=AUTH0_CLIENT_ID=xxxxxxxx`