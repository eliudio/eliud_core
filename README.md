# eliud

Documentation for eliud is under construction. Please be patient.

- Eliud technology is open source technology. 
- The technology allows to build apps and/or websites. Today, app content can include photo galleries, pages with videos and images (html), social media, chat with or between members, your shop / shopping cart, photo sliders, documents, and more. A complete list below.
- Eliud is a layer on top of Flutter. Flutter is an open-source UI software development kit created by Google. Flutter allows to develop cross platform applications for iOS, Android and web. Flutter supports Linux, macOS, Windows and Google Fuchsia. This hasn't been tested with eliud packages yet.
- For those who know Worpress: Eliud is to Flutter as Wordpress is to html:
  - Html allows you to construct webpages. However, html requires some level of technical knowledge about building webpages.
    - Wordpress and many other similar technologies allow people without knowledge of html to build webpages and websites.
  - Flutter allows to build websites and apps, or even Windows, Linux, macOS and Google Fuchsia apps. However, Flutter requires programming skills and technical knowledge.
    - Eliud allows people without programming skills and technical knowledge to build cross platform apps and websites.
- Eliud is pluggable technology, allowing developers 
  - to extend / add functionalities by means of plugins / packages.
  - to change look and feel through using styles.
- A website / app built with Eliud consist of its core Eliud package + one or more Eliud plugins. The app is constructed by configuring it. Configuration, images and videos are stored in Firebase database and Firebase storage.

## Example Eliud apps

These are some example apps which demonstrate what eliud can give you. Everything used is open source, part of eliud project.

|                                                                                         | App                                            | Ios                                                                          |Android                                                                                      | Web                                                    |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------- |-------------------------------------------------------------------------------------------- |------------------------------------------------------- |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/juuwle-logo-128.jpg) | Juuwle - An online store for jewels            | [Juuwle on the App Store](https://apps.apple.com/us/app/juuwle/id6449458929) |[Juuwle on Google Play](https://play.google.com/store/apps/details?id=net.juuwle.juuwle)    | [https://juuwle.net](https://juuwle.net)              |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/minkey-logo-128.png) | Minkey - Community making apps online          | This type of app is not allowed on apple store                               | [Minkey on Google Play](https://play.google.com/store/apps/details?id=io.minkey.minkey_app)| [https://minkey.io](https://minkey.io)                |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/thoma5-logo-128.png) | Thoma5 - Profile of Thomas. Under construction | In development                                                               | In development                                                                             | [https://thoma5.com](https://thoma5.com)              |

---

## Quick start

This guide are all steps to create a minimum android, iOS or web app with Eliud.

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>Whenever this pops up, make note of this for what this is in your case, as you'll need it at some later stage. In the below text we provided this information whilst creating thoma5. Obviously for sensitive information, like passwords, we've provided fake info.</td>
    </tr>
</table>

---

### Step 1: Create a new google account

1. Goto https://www.google.com/account/about/
2. Select "Create an account"
3. Follow on screen instructions 
(recommended to use default settings)

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="google_account"><ins>google account</ins></a>: thoma5.com.info@gmail.com</li>
          <li><ins>google account password</ins></li>
        </ul>
      </td>
    </tr>
</table>

---

### Step 2: Create a new firebase project

1. Goto https://console.firebase.google.com
2. Select "Create a project"
3. And follow on screen instructions 
(recommended to use default settings)

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="firebase_project"><ins>firebase project</ins></a>: thoma5</li>
        </ul>
      </td>
    </tr>
</table>

---

### Step 3: Configure your project

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Project Overview > Project settings
4. Select support email, which should be specified in step 1: <a href="#google_account">Google account</a>

---

### Step 4: Setup Firebase database

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Build > Firebase database
4. Select "Create database"
5. And follow on screen instructions 
(recommended to use default settings, start in production mode)
6. With Cloud Firestore open, click on Rules and copy/paste the 
contents of 
[firestore.rules](https://raw.githubusercontent.com/eliudio/open-resources/main/firebase/firestore.rules)

---

### Step 5: Setup Firebase storage

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Build > Storage
4. Select "Get started"
5. And follow on screen instructions 
(recommended to use default settings, start in production mode)
6. With Storage open, click on Rules and copy/paste the 
contents of 
[storage.rules](https://raw.githubusercontent.com/eliudio/open-resources/main/firebase/storage.rules) and publish

---

### Step 6: Setup Google Authentication

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Authentication
4. Select Sign-in method
5. Select Google from Sign-in providers
6. Enable the Google sign-in

---

### Step 7: Generate key

1. Run the following command at command prompt:

~~~
keytool -genkey -v -keystore your_keystore_filename -storepass your_keystore_storepass -alias your_keystore_alias -keypass your_keystore_keypass -keyalg RSA -keysize 2048 -validity 36524
~~~

2. Then follow onscreen instructions. Then store the key-file in a safe place. You will have to use it multiple times in the future.

3. Now run:

~~~
keytool -list -v -alias your_keystore_alias -keystore your_keystore_filename -storepass your_keystore_storepass -keypass your_keystore_keypass
~~~

For example:

~~~
keytool -genkey -v -keystore %USERPROFILE%\\.android\\thoma5.keystore -storepass abc -alias thoma5key -keypass cde -keyalg RSA -keysize 2048 -validity 36524
keytool -list -v -alias thoma5key -keystore %USERPROFILE%\\.android\\thoma5b.keystore -storepass abc -keypass cde
~~~

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="keystore_filename"><ins>Your keystore filename</ins></a>: %USERPROFILE%\\.android\\thoma5.keystore</li>
          <li><a name="keystore_storepass"><ins>Your keystore storepass</ins></a>: abc</li>
          <li><a name="keystore_keypass"><ins>Your keystore keypass</ins></a>: cde</li>
          <li><a name="keystore_alias"><ins>Your keystore alias</ins></a>: thoma5key</li>
          <li><a name="keystore_SHA1"><ins>Your keystore SHA1</ins></a>: A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:AA:BB</li>
        </ul>
      </td>
    </tr>
</table>

**MORE INFO**

<ul>
  <li><a href="https://developers.google.com/android/guides/client-auth">https://developers.google.com/android/guides/client-auth</a></li>
  <li><a href="https://coderwall.com/p/r09hoq/android-generate-release-debug-keystores">https://coderwall.com/p/r09hoq/android-generate-release-debug-keystores</a></li>
</ul>

---

### Step 8: Add Firebase Android App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Android'"
4. Specify your android package name
5. Specify your android app nickname
6. Paste the SHA-1 key from step 7: <a href="#keystore_SHA1">Your keystore SHA1</a>
7. Press "Register app"
8. Then download the file google-services.json

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_package_name"><ins>Your Android app package name</ins></a>: com.thoma5.thoma5_app</li>
          <li><a name="android_app_nickname"><ins>Your Android app nickname</ins></a>: Thoma5</li>
          <li><a name="google_services_json_filename"><ins>Your downloaded google-services.json file</ins></a>: C:\Users\johan\Downloads\google-services.json</li>
        </ul>
      </td>
    </tr>
</table>

---

### Step 9: Create Android Studio project

1. Start Android studio
2. Select File > New > New Flutter Project
3. Specify 
   1. Flutter SDK path and press Next
4. Specify 
   1. Project name: e.g. thoma5_app 
   2. Project location: e.g. C:\src\apps\thoma5_app
   3. Description: e.g. Thoma5 app
   4. Project type: Should be "Application"
   5. Organization: e.g. com.thoma5
   6. Android language: Should be Java
   7. iOS language: Should be Swift
   8. Platforms: Should be Android, iOS and Web
   
   :exclamation: **IMPORTANT** :exclamation:
   <p>The android package name specified in step 8 <a href="#android_package_name">Your Android app package name</a> - e.g. com.thoma5.thoma5_app - should be equal to the concatenation of organisation - e.g. com.thoma5 - a dot and the project_name - e.g. thoma5_app</p>

5. Press finish

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="flutter_sdk_path"><ins>Flutter SDK path</ins></a>: c:\dev\flutter</li>
          <li><a name="project_name"><ins>Project name</ins></a>: thoma5_app</li>
          <li><a name="organization"><ins>Organization</ins></a>: com.thoma5</li>
        </ul>
      </td>
    </tr>
</table>

---

### Step 10: Copy google_services.json

1. Switch to the Project view in Android Studio to see your project root directory.
2. Move <a href="#google_services_json_filename">your downloaded google-services.json file</a> from step 8 into into your module (app-level) root directory, e.g. thoma5_app/android/app

---

### Step 11: Apply firebase SDK instructions

1. Goto https://console.firebase.google.com
2. Select your project
3. Find your app from "your apps" section, then press "See SDK instructions"
4. You get to chance to re-download the google_services.json file, skip this by pressing next.
5. Now apply the suggestions provided. Make sure to select Groovy (build.gradle) and Java.

:thinking:
<p>At the time of writing this document, the changes to make were:

| file | location | add |
| ---- | ---- | ---- |
| :one: thoma5_app/android/build.gradle | buildscripts > dependencies | classpath 'com.google.gms:google-services:4.3.15' | 
| :two: thoma5_app/android/app/build.gradle | plugins | id 'com.google.gms.google-services' | 

<p>:three: Finally the below at the bottom of thoma5_app/android/app/build.gradle had to be added

~~~

dependencies {
    // Import the Firebase BoM
    implementation platform('com.google.firebase:firebase-bom:32.2.2')


    // TODO: Add the dependencies for Firebase products you want to use
    // When using the BoM, don't specify versions in Firebase dependencies
    implementation 'com.google.firebase:firebase-analytics'


    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
}

~~~

---

### Step 12: Add key store file to your project

1. Create key.properties file in your android directory, e.g thoma5/android/key.properties
2. Populate it with the below keys and values as below. Find your values from step 7, i.e. 
   1. storeFile=<a href="#keystore_filename">Your keystore filename</a>
   2. storePassword=<a href="#keystore_storepass">Your keystore storepass</a>
   3. keyPassword=<a href="#keystore_keypass">Your keystore keypass</a>
   4. keyAlias=<a href="#keystore_alias">Your keystore alias</a>
   
   e.g. 
   
   ~~~
   storePassword=abc
   keyPassword=cde
   keyAlias=thoma5key
   storeFile=c:/Users/thomas/.android/thoma5.keystore
   ~~~

3. Add the following lines to your android apps build.gradle file, e.g. thoma5/android/app/build.gradle

   1. Load the properties
   
   ~~~
   plugins {
      ...
   }
   
   // add this after plugins
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   // the rest of the file   
   ...
   ~~~

   2. Use the keystore for signinConfigs

   ~~~
   android {
       defaultConfig {
          ...
       }

       // add this after defaultConfig and before buildTypes
       signingConfigs {
           release {
               keyAlias keystoreProperties['keyAlias']
               keyPassword keystoreProperties['keyPassword']
               storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
               storePassword keystoreProperties['storePassword']
           }
       }

       buildTypes {
          ...
       }
   }
   ~~~
   
   3. Make sure your buildTypes is pointing to the releasing signingConfigs for both debug and release builds
   
   ~~~
   buildTypes {
        release {
            signingConfig signingConfigs.release
        }
        debug {
            signingConfig signingConfigs.release
            debuggable true
        }
   }   
   ~~~

---

### Step 13: Update pubspec.yaml

1. Update you pubspec.yaml file to reflect the below

~~~
---
name: thoma5_app
description: Thoma5
homepage: https://thoma5.com
repository: https://github.com/eliudio/thoma5_app
version: 1.0.0
environment:
  sdk: '>=3.1.0 <4.0.0'
  flutter: '>=3.0.0'
dependencies:
  flutter:
    sdk: flutter
  eliud_core: ^1.0.6+1
  eliud_pkg_create: ^1.0.7+1
  eliud_stl_mona: ^1.0.1+6
dev_dependencies:
  flutter_lints: ^2.0.0
flutter:
  uses-material-design: true
~~~

and press Pub get

---

### Step 14: Update main.dart

1. Replace your main.dart with these contents.

~~~
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/style/_default/default_style_family.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_pkg_create/creator_package.dart';
import 'package:eliud_pkg_create/tools/basic_app.dart';
import 'package:eliud_pkg_text/text_package.dart';
import 'package:eliud_stl_mona/mona_stl_package.dart';
import 'package:eliud_pkg_create/creator_decoration.dart';
import 'package:eliud_stl_mona/mona_style_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  String APP_ID = "THOMA5_APP";

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var eliud = Eliud();

  try {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(TextPackage.instance());
    eliud.registerPackage(MonaStlPackage.instance());
    eliud.registerPackage(CreatorPackage.instance());

    // register decorations, these are only required if you want to be able to change your app through the interface
    eliud.registerDecoration(CreatorDecoration());

    // register style families
    eliud.registerStyleFamily(MonaStyleFamily.instance());
    eliud.registerStyleFamily(DefaultStyleFamily.instance());

    // finish init
    eliud.finalizeInitialisation();
  } catch (exception) {
    throw Exception("Exception whilst initialising the app");
  }

  // create the app if it doesn't exist
  await BasicApp.checkApp(APP_ID);

  // let's go !
  eliud.run(APP_ID, false);
}

~~~

---

### Step 15: Clean up

1. Delete the directory test, which contains widget_test.dart

---

### Step 16: minSdkVersion

1. Goto your <a href="#flutter_sdk_path">Flutter SDK path</a>, specified in step 9, subdirectory packages\flutter_tools\gradle\src\main\groovy and edit the file flutter.groovy and open it
2. Update the value for minSdkVersion to be 21

   ~~~
   class FlutterExtension {
       ...

       /** Sets the minSdkVersion used by default in Flutter app projects. */
       static int minSdkVersion = 21

       ...
   }
   ~~~

   :exclamation: **REMARK** :exclamation:
   <p>We only need to make this change to the minSdkVersion for the SDK 1 time, i.e. do not repeat this step for future projects / apps.</p>

---

### Step 17: Run your app

1. Run the app. Because this is the first time your start the app, it will install a basic app. 
2. When the app asks to choose an account to login, select the <a href="#google_account">Google account</a> you created in step 1
3. Ones the basic app is created, it will open

### Step 18: Add some basic functionality to your app

1. After you've started your app in step 17, a "Hello world" screen should appear.
2. Press the pen icon ![Pen](https://github.com/eliudio/open-resources/raw/main/img/icons/pen.png) to toggle editing mode on
3. When in edit mode, press the wizard icon ![Wizard](https://github.com/eliudio/open-resources/raw/main/img/icons/star.png) to open the wizard dialog box
4. We have only activated a few packages in step 14, so hence not many wizards are initially available. 
   1. Select signinbutton and press Go!
   2. Then select signoutbutton and press Go!

---

### Step 16: Add some basic functionality to your app

TODO: Congratulations + next steps

---

## Cookbook
In this cookbook we will create a new app from scratch. 
We continue from the quick start.
We assume you're building an app for web, android and ios. 
Skip what doesn't apply to you.

### Stuff delayed from quick start

TODO describe and to put somewhere better

#### Logo

1. add the below to pubspec.yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_icons:
  android: launcher_icon
  ios: false
  image_path: assets/logo/thoma5-logo.png

and run the logo generation thing

#### main.dart

1. Include the below for web
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCl6sRbHLs4iZmgAm9c9haOta9Hm6Ur2l0",
            authDomain: "minkey-2c028.firebaseapp.com",
            projectId: "minkey-2c028",
            storageBucket: "minkey-2c028.appspot.com",
            messagingSenderId: "1024431136717",
            appId: "1:1024431136717:web:6dccc1c905ef84d31cee84",
            measurementId: "G-0J2M6CNHLV"));
  } else {
    await Firebase.initializeApp();
  }

### preparations
#### 1. decide on the following

#### 2. buy domain

example: squarespace.com

#### 4. setup email forwarding

#### 5. register for free gcp

#### 6. Setup OAuth Client 

#### 7. Apple setup

#### 8. Sendgrid setup

### firebase

#### 1. create project

#### 2. firebase database

#### 3. firebase storage

#### 4. authentication

#### 5. functions

### android studio

#### 1. android app

#### 2. web app

#### 3. ios app

### run and deploy to app store

#### 1. android app

#### 2. web app

#### 3. ios app

## overview packages / dependencies

### typical
A typical app, here Minkey, uses the following dependencies:

![Dependency diagram](https://github.com/eliudio/eliud_core/raw/main/minkey-depends.jpg)

### links
|Package                                                                    |Description                                            |
|---------------------------------------------------------------------------|-------------------------------------------------------|
|[eliud_core](https://pub.dev/packages/eliud_core)                          | This package                                          |
|[eliud_generator](https://pub.dev/packages/eliud_generator)                | Eliud generator                                       |
|[eliud_pkg_apps](https://pub.dev/packages/eliud_pkg_apps)                  | Eliud package for creating apps through code, not gui |
|[eliud_pkg_chat](https://pub.dev/packages/eliud_pkg_chat)                  | Eliud chat package                                    |
|[eliud_pkg_create](https://pub.dev/packages/eliud_pkg_create)              | Eliud create package                                  |
|[eliud_pkg_etc](https://pub.dev/packages/eliud_pkg_etc)                    | Eliud etc package                                     |
|[eliud_pkg_feed](https://pub.dev/packages/eliud_pkg_feed)                  | Eliud feed package                                    |
|[eliud_pkg_follow](https://pub.dev/packages/eliud_pkg_follow)              | Eliud follow package                                  |
|[eliud_pkg_fundamentals](https://pub.dev/packages/eliud_pkg_fundamentals)  | Eliud fundamentals package                            |
|[eliud_pkg_medium](https://pub.dev/packages/eliud_pkg_medium)              | Eliud medium package                                  |
|[eliud_pkg_membership](https://pub.dev/packages/eliud_pkg_membership)      | Eliud membership package                              |
|[eliud_pkg_notifications](https://pub.dev/packages/eliud_pkg_notifications)| Eliud notifications package                           |
|[eliud_pkg_pay](https://pub.dev/packages/eliud_pkg_pay)                    | Eliud pay package                                     |
|[eliud_pkg_shop](https://pub.dev/packages/eliud_pkg_shop)                  | Eliud shop package                                    |
|[eliud_pkg_text](https://pub.dev/packages/eliud_pkg_text)                  | Eliud text package                                    |
|[eliud_pkg_wizards](https://pub.dev/packages/eliud_pkg_wizards)            | Eliud wizards package                                 |
|[eliud_pkg_workflow](https://pub.dev/packages/eliud_pkg_workflow)          | Eliud workflow package                                |
|[eliud_stl_mona](https://pub.dev/packages/eliud_stl_mona)                  | Eliud mona style                                      |
