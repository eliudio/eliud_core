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

## Quick start

This guide are all steps to create a minimum android, iOS or web app with Eliud.

> :bulb: **NOTE** :bulb:
> <ul><li>Whenever this note pops up in the below text, make note of this for what this is in your case, as you'll need it at some later stage. In the below text we provided this information whilst creating thoma5. Obviously for sensitive information, like passwords, we've provided fake info</li></ul>

### Step 1: Create a new google account

1. Goto https://www.google.com/account/about/
2. Select "Create an account"
3. Follow on screen instructions 
(recommended to use default settings)

> :bulb: **NOTE** :bulb:
> <ul><li><a name="google_account"><ins>google account</ins></a>: thoma5.com.info@gmail.com</li>
> <li><ins>google account password</ins></li></ul>

### Step 2: Create a new firebase project

1. Goto https://console.firebase.google.com
2. Select "Create a project"
3. And follow on screen instructions 
(recommended to use default settings)

> :bulb: **NOTE** :bulb:
> <ul><li><a name="firebase_project"><ins>firebase project</ins></a>: thoma5</li></ul>

### Step 3: Configure your project

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Project Overview > Project settings
4. Select support email, which should be specified in step 1: <a href="#google_account">Google account</a>

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

### Step 6: Setup Google Authentication

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Authentication
4. Select Sign-in method
5. Select Google from Sign-in providers
6. Enable the Google sign-in

### Step 7: Generate key

1. Run the following command at command prompt:

    keytool -genkey -v -keystore your_keystore_filename -storepass your_keystore_storepass -alias your_keystore_alias -keypass your_keystore_keypass -keyalg RSA -keysize 2048 -validity 36524

2. Then follow onscreen instructions. Then store the key-file in a safe place. You will have to use it multiple times in the future.

3. Now run:

    keytool -list -v -alias your_keystore_alias -keystore your_keystore_filename -storepass your_keystore_storepass -keypass your_keystore_keypass

For example:

    keytool -genkey -v -keystore %USERPROFILE%\\.android\\thoma5.keystore -storepass abc -alias thoma5key -keypass cde -keyalg RSA -keysize 2048 -validity 36524
    keytool -list -v -alias thoma5key -keystore %USERPROFILE%\\.android\\thoma5b.keystore -storepass abc -keypass cde

> :bulb: **NOTE** :bulb:
> <ul><li><a name="keystore_filename"><ins>Your keystore filename</ins></a>: %USERPROFILE%\\.android\\thoma5.keystore</li>
> <li><a name="keystore_storepass"><ins>Your keystore storepass</ins></a>: abc</li>
> <li><a name="keystore_keypass"><ins>Your keystore keypass</ins></a>: cde</li>
> <li><a name="keystore_SHA1"><ins>Your keystore SHA1</ins></a>: A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:AA:BB</li>
> <li><a name="keystore_alias"><ins>Your keystore alias</ins></a>: thoma5key</li></ul>

> :question: **MORE INFO** :question:
> <ul><li><a href="https://developers.google.com/android/guides/client-auth">https://developers.google.com/android/guides/client-auth</a></li>
> <li><a href="https://coderwall.com/p/r09hoq/android-generate-release-debug-keystores">https://coderwall.com/p/r09hoq/android-generate-release-debug-keystores</a></li></ul>

### Step 8: Add Firebase Android App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Android'"
4. Specify your android package name
5. Specify your android app nickname
6. Paste the SHA-1 key from step 7: <a href="#keystore_SHA1">Your keystore SHA1</a>
7. Press "Register app"
8. Then download the file google-services.json

> :bulb: **NOTE** :bulb:
> <ul><li><a name="android_package_name"><ins>Your Android app package name</ins></a>: com.thoma5.thoma5_app</li>
> <li><a name="android_app_nickname"><ins>Your Android app nickname</ins></a>: Thoma5</li>
> <li><a name="google_services_json_filename"><ins>Your downloaded google-services.json file</ins></a>: C:\Users\johan\Downloads\google-services.json</li></ul>

### Step 9: Create Android Studio project

1. Start Android studio
2. Select File > New > New Flutter Project
3. Specify the location of your flutter SDK path and press Next
4. Specify project name, location, etc..
5. Press finish

> :bulb: **NOTE** :bulb:
> <ul><li><a name="project_name"><ins>Project name</ins></a>: Thoma5</li>
> <li><a name="project_location"><ins>Project location</ins></a>: C:\src\apps\thoma5</li>
> <li><a name="project_description"><ins>Description</ins></a>: Thoma5 project</li>
> <li><a name="project_type"><ins>Project type</ins></a>: Application</li>
> <li><a name="organization"><ins>Organization</ins></a>: com.thoma5</li>
> <li><a name="android_language"><ins>Android language</ins></a>: Java</li>
> <li><a name="ios_language"><ins>iOS language</ins></a>: Swift</li>
> <li><a name="platforms"><ins>Platforms</ins></a>: Android, iOS and Web</li></ul>

> :exclamation: **IMPORTANT** :exclamation:
> <ul><li>Organisation + project name should equal Android package name specified in step 8 <a href="#android_package_name">Your Android app package name</a></li></ul>

## Cookbook
In this cookbook we will create a new app from scratch. 
We continue from the quick start.
We assume you're building an app for web, android and ios. 
Skip what doesn't apply to you.

### preparations
#### 1. decide on the following

#### 2. buy domain

example: squarespace.com

#### 3. create google account

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
