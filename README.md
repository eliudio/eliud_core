# eliud

Build apps with no code. Or with code, of course, if you want. 
But then just the code you like to focus on :-)

<!-- toc -->

- [Introduction](#introduction)
  * [Example Eliud apps](#example-eliud-apps)
- [Chapter I. Create a simple "hello world" Android app](#chapter-i-create-a-simple-hello-world-android-app)
  * [Step 1: Decide on domain name and app nickname](#step-1-decide-on-domain-name-and-app-nickname)
  * [Step 2: Create a new google account](#step-2-create-a-new-google-account)
  * [Step 3: Create a new firebase project](#step-3-create-a-new-firebase-project)
  * [Step 4: Configure your project](#step-4-configure-your-project)
  * [Step 5: Setup Firebase database](#step-5-setup-firebase-database)
  * [Step 6: Setup Firebase storage](#step-6-setup-firebase-storage)
  * [Step 7: Setup Google Authentication](#step-7-setup-google-authentication)
  * [Step 8: Generate a Private Key](#step-8-generate-a-private-key)
  * [Step 9: Add Firebase Android App](#step-9-add-firebase-android-app)
  * [Step 10: Create Android Studio project](#step-10-create-android-studio-project)
  * [Step 11: Copy google_services.json](#step-11-copy-google_servicesjson)
  * [Step 12: Apply firebase SDK instructions](#step-12-apply-firebase-sdk-instructions)
  * [Step 13: Add key store file to your project](#step-13-add-key-store-file-to-your-project)
  * [Step 14: Update pubspec.yaml](#step-14-update-pubspecyaml)
  * [Step 15: Update main.dart](#step-15-update-maindart)
  * [Step 16: Clean up](#step-16-clean-up)
  * [Step 17: minSdkVersion](#step-17-minsdkversion)
  * [Step 18: AD_ID](#step-18-ad_id)
  * [Step 19: Run your app](#step-19-run-your-app)
  * [Step 20: Add some basic functionality to your app](#step-20-add-some-basic-functionality-to-your-app)
  * [Step 21: Configure your app further](#step-21-configure-your-app-further)
- [Chapter II. Create the webapp and configure firebase](#chapter-ii-create-the-webapp-and-configure-firebase)
  * [Step 1: Buy domain](#step-1-buy-domain)
  * [Step 3: Logo](#step-3-logo)
  * [Step 4: Add Firebase Web App](#step-4-add-firebase-web-app)
  * [Step 5: Retrieve hosting details](#step-5-retrieve-hosting-details)
  * [Step 6: Setup email forwarding](#step-6-setup-email-forwarding)
  * [Step 7: Subscribe to mailtrap](#step-7-subscribe-to-mailtrap)
  * [Step 8: Setup DNS records for firebase hosting](#step-8-setup-dns-records-for-firebase-hosting)
    + [Example 1: domains.google.com](#example-1-domainsgooglecom)
    + [Example 2: squarespace.com](#example-2-squarespacecom)
  * [Step 9: Setup DNS records for mailtrap](#step-9-setup-dns-records-for-mailtrap)
    + [Example 1: domains.google.com](#example-1-domainsgooglecom-1)
    + [Example 2: squarespace.com](#example-2-squarespacecom-1)
  * [Step 10: Verify mailtrap setup](#step-10-verify-mailtrap-setup)
  * [Step 11: Update firebase](#step-11-update-firebase)
    + [Step 11.1: Install firebase command line tools](#step-111-install-firebase-command-line-tools)
    + [Step 11.2: Enable APIs](#step-112-enable-apis)
    + [Step 11.3: Enable firebase functions](#step-113-enable-firebase-functions)
    + [Step 11.4 Update firebase](#step-114-update-firebase)
  * [Step 12: Enable APIs](#step-12-enable-apis)
  * [Step 13: Add Authorized domains to Authentication](#step-13-add-authorized-domains-to-authentication)
  * [Step 14: Configure oauth web client](#step-14-configure-oauth-web-client)
  * [Step 15: Configure Android Studio project for web](#step-15-configure-android-studio-project-for-web)
    + [Step 15.1: Update pubspec.yaml](#step-151-update-pubspecyaml)
    + [Step 15.2: Update main.dart](#step-152-update-maindart)
    + [Step 15.3: Create images and stylesheet](#step-153-create-images-and-stylesheet)
    + [Step 15.4: Update index.html](#step-154-update-indexhtml)
  * [Step 16: Cors`](#step-16-cors)
  * [Step 17: Deploy your website](#step-17-deploy-your-website)
  * [Step 18: Create policies / policy pages](#step-18-create-policies--policy-pages)
  * [Step 19: Create membership dashboard page](#step-19-create-membership-dashboard-page)
  * [Step 20: Setup oauth consent](#step-20-setup-oauth-consent)
  * [Step 21: Start your free google GCP trial 300 USD](#step-21-start-your-free-google-gcp-trial-300-usd)
- [Chapter III. Create the ios app](#chapter-iii-create-the-ios-app)
  * [Step 1: Register as apple developer](#step-1-register-as-apple-developer)
  * [Step 2: Create or Update an Apple App ID](#step-2-create-or-update-an-apple-app-id)
  * [Step 3: Register your apple device](#step-3-register-your-apple-device)
  * [Step 4: Create an Apple Service ID](#step-4-create-an-apple-service-id)
  * [Step 5: Register a Private Key for you apple developer account](#step-5-register-a-private-key-for-you-apple-developer-account)
  * [Step 6: Enable Apple sign-in on Firestore](#step-6-enable-apple-sign-in-on-firestore)
  * [Step 7: Provide Web Authentication Configuration for your Service ID](#step-7-provide-web-authentication-configuration-for-your-service-id)
  * [Step 8: Create Apple firebase app](#step-8-create-apple-firebase-app)
  * [Step 9: Setup ios project](#step-9-setup-ios-project)
  * [Step 10: Configure the Android Studio project for apple](#step-10-configure-the-android-studio-project-for-apple)
  * [Step 11. GoogleService-Info.plist](#step-11-googleservice-infoplist)
  * [Step 12. Info.plist](#step-12-infoplist)
    + [Step 12.1. Add a URL scheme to your project](#step-121-add-a-url-scheme-to-your-project)
    + [Step 12.2. Indicate your app does not use encryption](#step-122-indicate-your-app-does-not-use-encryption)
    + [Step 12.3. Add camera, microphone and photo library access](#step-123-add-camera-microphone-and-photo-library-access)
    + [Step 12.4. Result file](#step-124-result-file)
  * [Troubleshouting steps](#troubleshouting-steps)
- [Chapter IV. Deploy to android store](#chapter-iv-deploy-to-android-store)
  * [Step 1. Build](#step-1-build)
  * [Optional: Step 2. Test the bundle](#optional-step-2-test-the-bundle)
  * [Step 3. Enroll to Android app store](#step-3-enroll-to-android-app-store)
  * [Step 4. Create App on Google Play](#step-4-create-app-on-google-play)
  * [Step 5. Provide App policy details](#step-5-provide-app-policy-details)
  * [Step 6. Main store listing](#step-6-main-store-listing)
    + [Step 6.1 Create a feature graphic](#step-61-create-a-feature-graphic)
    + [Step 6.2 Take screenshots](#step-62-take-screenshots)
    + [Step 6.2.1 Create virtual machines](#step-621-create-virtual-machines)
    + [Step 6.2.2 Run the app and take screenshots](#step-622-run-the-app-and-take-screenshots)
    + [Step 6.2.3 Create icon 512 x 512 pixels](#step-623-create-icon-512-x-512-pixels)
    + [Step 6.3 Submit main store listing details](#step-63-submit-main-store-listing-details)
  * [Step 7. Store settings](#step-7-store-settings)
  * [Step 8. Countries/regions](#step-8-countriesregions)
  * [Step 9. Upload for production](#step-9-upload-for-production)
  * [Step 10: Sign in](#step-10-sign-in)
  * [Step 11: Publishing overview](#step-11-publishing-overview)
- [Chapter V. Deploy to apple store](#chapter-v-deploy-to-apple-store)
  * [Step 1: Enroll for the Apple Developer Program.](#step-1-enroll-for-the-apple-developer-program)
  * [Step 2: Create an app on App Store Connect](#step-2-create-an-app-on-app-store-connect)
  * [Step 3: Provide App Information](#step-3-provide-app-information)
  * [Step 4: Create a build archive](#step-4-create-a-build-archive)
  * [Step 5: Upload to App Store Connect](#step-5-upload-to-app-store-connect)
    + [Option 5.1: Use upload tool](#option-51-use-upload-tool)
    + [Option 5.2: Use transport app](#option-52-use-transport-app)
  * [Step 6: Take screenshots](#step-6-take-screenshots)
  * [Step 6.1: Create simulators](#step-61-create-simulators)
  * [Step 6.2 Create screenshots](#step-62-create-screenshots)
  * [Step 7: Create test user](#step-7-create-test-user)
  * [Step 8: Provide App Privacy details](#step-8-provide-app-privacy-details)
  * [Step 9: Pricing and Availability](#step-9-pricing-and-availability)
  * [Step 10: Submit the app](#step-10-submit-the-app)
- [Chapter VI. Extend the app with other packages](#chapter-vi-extend-the-app-with-other-packages)
- [Chapter VII. Write and integrate your own code / packages](#chapter-vii-write-and-integrate-your-own-code--packages)
- [Appendix A. Overview packages](#appendix-a-overview-packages)
  * [The dependencies of a typical app](#the-dependencies-of-a-typical-app-)
  * [Links](#links-)

<!-- tocstop -->

# Introduction

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

The below steps document the creation of your own android + apple + web app and includes all instructions, all the way to pushing your app into the apple app store, android store and web. 

## Example Eliud apps

These are some example apps which demonstrate what eliud can give you. Everything used is open source, part of eliud project.

|                                                                                          | App                                            | Ios                                                                          | Android                                                                                      | Web                                                    |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------- |----------------------------------------------------------------------------------------------|----------------------------------------- |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/juuwle-logo-128.jpg) | Juuwle - An online store for jewels            | [Juuwle on the App Store](https://apps.apple.com/us/app/juuwle/id6449458929) | [Juuwle on Google Play](https://play.google.com/store/apps/details?id=net.juuwle.juuwle)     | [https://juuwle.net](https://juuwle.net) |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/minkey-logo-128.png) | Minkey - Community making apps online          | This type of app - allowing to create apps from within the app - is not allowed on apple store | [Minkey on Google Play](https://play.google.com/store/apps/details?id=io.minkey.minkey_app)  | [https://minkey.io](https://minkey.io)   |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/thoma5-logo-128.png) | Thoma5 - Profile of Thomas. Under construction | [Thoma5 on App Store](https://apps.apple.com/us/app/thoma5/id6470151933) | [Thoma5 on Google Play](https://play.google.com/store/apps/details?id=com.thoma5.thoma5_app) | [https://thoma5.com](https://thoma5.com) |

---

# Chapter I. Create a simple "hello world" Android app

This guide are all steps to create a minimum android, iOS or web app with Eliud.

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>Whenever this pops up, make note of this for what this is in your case, as you'll need it at some later stage. In the below text we provided this information whilst creating thoma5, as an example. Obviously for sensitive information, like passwords, we've provided fake info.</td>
    </tr>
</table>

---

## Step 1: Decide on domain name and app nickname

Decide your app name and web domain.

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="domain_name"><ins>your domain</ins></a>: thoma5.com</li>
          <li><a name="app_nickname"><ins>your app nickname</ins></a>: Thoma5</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 2: Create a new google account

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

## Step 3: Create a new firebase project

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

## Step 4: Configure your project

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Project Overview > Project settings
4. Select support email. Use your <a href="#google_account">google account</a>

---

## Step 5: Setup Firebase database

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Build > Firebase database
4. Select "Create database"
5. And follow on screen instructions (recommended to use default settings, start in production mode)
6. With Cloud Firestore open, click on Rules and copy/paste the 
   contents of [firestore.rules](https://raw.githubusercontent.com/eliudio/firebase/main/firestore.rules) 
   and publish.

   <i>For convenience, and to familiarise yourself with firebase, at this point we copy/paste these rules. 
   However, later we will upload the same rules more efficiently using firestore commands from command line
   </i>

---

## Step 6: Setup Firebase storage

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Build > Storage
4. Select "Get started"
5. And follow on screen instructions (recommended to use default settings, start in production mode)
6. With Storage open, click on Rules and copy/paste the contents of 
   [storage.rules](https://raw.githubusercontent.com/eliudio/firebase/main/storage.rules) 
   and publish.

   <i>For convenience, and to familiarise yourself with firebase, at this point we copy/paste these rules. 
   However, later we will upload the same rules more efficiently using firestore commands from command line
   </i>

7. With storage page open, retrieve your "bucket" from the url. You bucket is the bit in front of ".appspot" in the url. In our case the url is https://console.firebase.google.com/project/thoma5/storage/thoma5.appspot.com/files, hence the bucket is thoma5

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="storage_bucket"><ins>storage bucket</ins></a>: thoma5</li>
        </ul>
      </td>
    </tr>
</table>
   
---

## Step 7: Setup Google Authentication

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Authentication
4. Select Sign-in method
5. Select Google from Sign-in providers
6. Enable the Google sign-in

---

## Step 8: Generate a Private Key

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
          <li><a name="keystore_filename"><ins>your keystore filename</ins></a>: %USERPROFILE%\\.android\\thoma5.keystore</li>
          <li><a name="keystore_storepass"><ins>your keystore storepass</ins></a>: abc</li>
          <li><a name="keystore_keypass"><ins>your keystore keypass</ins></a>: cde</li>
          <li><a name="keystore_alias"><ins>your keystore alias</ins></a>: thoma5key</li>
          <li><a name="keystore_SHA1"><ins>your keystore SHA1</ins></a>: A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:A0:B1:C2:D3:E4:F5:AA:BB</li>
        </ul>
      </td>
    </tr>
</table>

**MORE INFO**

<ul>
  <li><a href="https://developers.google.com/android/guides/client-auth">Authenticating Your Client</a></li>
  <li><a href="https://coderwall.com/p/r09hoq/android-generate-release-debug-keystores">Android: Generate Release/Debug Keystores (Example)</a></li>
</ul>

---

## Step 9: Add Firebase Android App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Android'"
4. Specify your android package name. This must be the inverse of <a href="#domain"><ins>your domain</ins></a>
5. Specify your android app nickname. This is <a href="#app_nickname">your app nickname</a>
6. Paste the SHA-1 key <a href="#keystore_SHA1">Your keystore SHA1</a>
7. Press "Register app"
8. Then download the file google-services.json


<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_package_name"><ins>your Android app package name</ins></a>: com.thoma5.thoma5_app</li>
          <li><a name="google_services_json_filename"><ins>your downloaded google-services.json file</ins></a>: C:\Users\johan\Downloads\google-services.json</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 10: Create Android Studio project

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
   <p>The android package name specified as <a href="#android_package_name">Your Android app package name</a> - e.g. com.thoma5.thoma5_app - should be equal to the concatenation of organisation - e.g. com.thoma5 - a dot and the project_name - e.g. thoma5_app</p>

5. Press finish

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="flutter_sdk_path"><ins>Flutter SDK path</ins></a>: c:\dev\flutter</li>
          <li><a name="project_name"><ins>Project name</ins></a>: thoma5_app</li>
          <li><a name="organization"><ins>Organization</ins></a>: com.thoma5</li>
          <li><a name="app_root_directory"><ins>Root dir</ins></a>: C:\src\apps\thoma5_app</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 11: Copy google_services.json

1. Switch to the Project view in Android Studio to see your project root directory.
2. Move <a href="#google_services_json_filename">your downloaded google-services.json file</a> into your module (app-level) root directory, e.g. thoma5_app/android/app

---

## Step 12: Apply firebase SDK instructions

1. Goto https://console.firebase.google.com
2. Select your project
3. Find your app from "your apps" section, then press "See SDK instructions"
4. You get to chance to re-download the google_services.json file, skip this by pressing next.
5. Now apply the suggestions provided. Make sure to select Groovy (build.gradle) and Java.

<p>At the time of writing this document, the changes to make were:

| file | location | add |
| ---- | ---- | ---- |
| (1) thoma5_app/android/build.gradle | buildscripts > dependencies | classpath 'com.google.gms:google-services:4.3.15' | 
| (2) thoma5_app/android/app/build.gradle | plugins | id 'com.google.gms.google-services' | 

<p>(3) Finally the below at the bottom of thoma5_app/android/app/build.gradle had to be added

~~~

dependencies {
    // Import the Firebase BoM
    implementation platform('com.google.firebase:firebase-bom:32.2.2')


    implementation 'com.google.firebase:firebase-analytics'


    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
}

~~~

---

## Step 13: Add key store file to your project

1. Create key.properties file in your android directory, e.g thoma5/android/key.properties
2. Populate it with the below keys and values as below. Find your values specified before (follow the links)
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

## Step 14: Update pubspec.yaml

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

2. run pub get

---

## Step 15: Update main.dart

1. Replace your main.dart with these contents.

~~~
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_model/style/_default/default_style_family.dart';
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

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <ul>
        <li><a name="APP_ID"><ins>APP_ID</ins></a>: THOMA5_APP</li>
      </ul>
    </td>
  </tr>
</table>

---

## Step 16: Clean up

1. Delete the directory test, which contains widget_test.dart

---

## Step 17: minSdkVersion

1. Goto your <a href="#flutter_sdk_path">Flutter SDK path</a>, subdirectory packages\flutter_tools\gradle\src\main\groovy and edit the file flutter.groovy and open it
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

## Step 18: AD_ID

To be able to upload our app to the google play store, we must specify that our app doesn't have adds. Obviously if you choose to change this then this is possible, but not scope of this guide. To keep things simple...

1. Open your AndroidManifest.xml file from your android directory//app/src/main/AndroidManifest.xml, e.g. C:/src/apps/thoma5_app/android/app/src/main/AndroidManifest.xml
2. Add xmlns:tools="http://schemas.android.com/tools" at the top, in the manifest node
3. Add the following to the bottom of the document

~~~

<uses-permission android:name="com.google.android.gms.permission.AD_ID" tools:node="remove"/>

~~~

4. That results in our case in the following contents:

~~~

<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools">
    <application
        android:label="thoma5_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <uses-permission android:name="com.google.android.gms.permission.AD_ID" tools:node="remove"/>
</manifest>

~~~

---

## Step 19: Run your app

1. Run the app. Because this is the first time your start the app, it will install a basic app. 
2. When the app asks to choose an account to login, select your <a href="#google_account">google account</a>
3. Ones the basic app is created, it will open

---

## Step 20: Add some basic functionality to your app

1. After you've started your app in the previous step, a "Hello world" screen should appear.
2. Press the pen icon ![Pen](https://github.com/eliudio/open-resources/raw/main/img/icons/edit.png) to toggle editing mode on.
3. Then press the ![Pen](https://github.com/eliudio/open-resources/raw/main/img/icons/edit.png) - app button 
   3.1 In the general section of the app:
       3.1.1. change the title of your application
       3.1.2. change the home url to your domain url. This is constructed with https:// followed by <a href="#domain_name">your domain name</a>

   3.2 In the "Welcome email document" section, provide a HTML document to welcome new joiners, like the one below. Use ${NAME} to address the person joining.

~~~
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Welcome new member</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <style type="text/css">
      @media only screen and (max-width:590px){
          .c1{
              background-color:white !important;
          }
          .c3a,
          .c3b{
              width:100% !important;
          }
      }
    </style>
  </head>
  <body>
    <center>
      <table border="0" cellpadding="0" height="100" width="100%">
        <tr>
          <td align="center" valign="middle">
            Welcome to Thoma5. Thanks for joining, ${NAME}.
          </td>
        </tr>
        <tr>
          <td align="center" valign="middle">
            As a member, enjoy 
            <ul>
            <li>the "feed", where you can share photos, videos, messages, documents.
            </li>
            <li>the chat, where you can chat with other members.
            </li>
            </ul>
          </td>
        </tr>
        <tr>
          <td align="center" valign="middle">
            Enjoy the app ${NAME}!
          </td>
        </tr>
      </table>
    </center>
  </body>
</html>
~~~

4. When in edit mode, press the wizard icon ![Wizard](https://github.com/eliudio/open-resources/raw/main/img/icons/wizard.png) to open the wizard dialog box.
5. We have only activated a few packages in the code (using eliud.registerPackage), so hence not many wizards are initially available. 
   1. Select signinbutton and press Go!
   2. Then select signoutbutton and press Go!

---

## Step 21: Configure your app further

At some point in the process you will obviously want to add more functionality to your app.
In [this document](docs/the-eliud-app.md) you find more details how to do so

---

# Chapter II. Create the webapp and configure firebase

In the previous steps we've done the foundation to build an app. The next big step is to introduce
- web deployment
- authentication
- functions to support packages

---

## Step 1: Buy domain

1. Buy <a href="#domain_name">your domain name</a>, e.g. on squarespace.com. 

---

## Step 3: Logo

1. create a logoand store into a file in your project directory, e.g. assets/logo/thoma5-logo-1.png

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <ul>
        <li><a name="logo"><ins>logo</a></ins>: assets/logo/thoma5-logo-1.png</li>
      </ul>
    </td>
  </tr>
</table>


2. add the below to pubspec.yaml

~~~
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: assets/logo/thoma5-logo-1.png
  image_path_ios: assets/logo/thoma5-logo-1.png
  remove_alpha_ios: true
  web:
    generate: true
    image_path: assets/logo/thoma5-logo-1.png

~~~

3. Run the below from your app directory

~~~
flutter pub run flutter_launcher_icons:main

~~~

---

## Step 4: Add Firebase Web App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Web'"
4. Provide your app nickname <a href="#app_nickname"><ins>your app nickname</ins></a>
5. Select Firebase Hosting. 
6. Select your project from the drop down box. 
7. Click on Register app. 
8. From the "Add Firebase to your web app" page, copy the firebaseConfig details

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td><a name="firebaseConfig">firebaseConfig</a></td>
  </tr>
</table>

~~~
const firebaseConfig = {
  apiKey: "ABcdEfG_H1Ij2KLmNo3PQ_RstUvwXY4Zabcdefg",
  authDomain: "thoma5.firebaseapp.com",
  projectId: "thoma5",
  storageBucket: "thoma5.appspot.com",
  messagingSenderId: "263405528229",
  appId: "1:123456789012:web:1a2345b6c7890d12ef345h",
  measurementId: "G-WL1A23456C"
};

~~~

---

## Step 5: Retrieve hosting details

1. Goto https://console.firebase.google.com
2. Find the "Add custom domain" button and add
   - <a href="thoma5.com">thoma5.com</a>
   - <a href="www.thoma5.com">www.thoma5.com</a>, and configure to redirect to thoma5.com
3. Make note of the DNS records. We'll need this in a later step.

<table>
  <tr>
    <td colspan="2">
      <A name="hosting_DNS_records">DNS records</A>
    </td>
  </tr>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <p>Domain: <a href="thoma5.com">thoma5.com</a></p>
      <table>
        <tr>
          <td>Record type</td>
          <td>Host</td>
          <td>Value</td>
        </tr>
        <tr>
          <td>A</td>
          <td>thoma5.com</td>
          <td>123.123.123.123</td>
        </tr>
        <tr>
          <td>TXT</td>
          <td>thoma5.com</td>
          <td>hosting-site=thoma5</td>
        </tr>
        <tr>
          <td>TXT</td>
          <td>_acme-challenge.thoma5.com</td>
          <td><p>aBcdE1FghIj23k4lmnoPqr</p><p>stUvw5xyZabcdeF6GHiJk</p></td>
        </tr>
      </table>
      <p>Domain: <a href="www.thoma5.com">www.thoma5.com</a></p>
      <table>
        <tr>
          <td>Record type</td>
          <td>Host</td>
          <td>Value</td>
        </tr>
        <tr>
          <td>CNAME</td>
          <td>www.thoma5.com</td>
          <td>thoma5.web.app</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

---

## Step 6: Setup email forwarding

1. Setup email forwarding

   - from info@thoma5.com
   - to: your <a href="#google_account">google account</a>

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="official_email"><ins>official email</ins></a>: info@thoma5.com</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 7: Subscribe to mailtrap

1. https://mailtrap.io/
2. Select sign up
3. Select "Use google account" and select your <a href="#google_account">google account</a>
4. Select "Email Sending", enter your domain and press "Add Your DomaiN"
5. Make note of the DNS records. We'll need this in a later step.

<table>
  <tr>
    <td colspan="2">
          <A name="mailtrap_DNS_records">DNS records</A>
    </td>
  </tr>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <table>
        <tr>
          <td>Status</td>
          <td>Category</td>
          <td>Type</td>
          <td>Name</td>
          <td>Value</td>
        </tr>
        <tr>
          <td>Missing</td>
          <td><p>Domain<p></p> Verification</p></td>
          <td>CNAME</td>
          <td>1abcdef2g34hijkl</td>
          <td>smpt.mailtrap.live</td>
        </tr>
        <tr>
          <td>Missing</td>
          <td>SPF</td>
          <td>TXT</td>
          <td>-</td>
          <td><p>v=spf1</p><p> include:_spf.smtp.mailtrap.live</p><p> ~all</p></td>
        </tr>
        <tr>
          <td>Missing</td>
          <td>DKIM</td>
          <td>CNAME</td>
          <td>rwmt1._domainkey</td>
          <td>rwmt1.dkim.smtp.mailtrap.live</td>
        </tr>
        <tr>
          <td>Missing</td>
          <td>DKIM</td>
          <td>CNAME</td>
          <td>rwmt2._domainkey</td>
          <td>rwmt2.dkim.smtp.mailtrap.live</td>
        </tr>
        <tr>
          <td>Missing</td>
          <td>DMARC</td>
          <td>TXT</td>
          <td>_dmarc</td>
          <td><p>v=DMARC1;</p><p> p=none;</p><p> rua=mailto:dmarc@smtp.mailtrap.live;</p><p> ruf=mailto:dmarc@smtp.mailtrap.live;</p><p> rf=afrf;</p><p> pct=100</p></td>
        </tr>
        <tr>
          <td>Missing</td>
          <td><p>Custom<p></p> domain<p></p> tracking</p></td>
          <td>CNAME</td>
          <td>mt-link</td>
          <td>t.mailtrap.live</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

6. Click next and in the SMTP/API Settings click API
7. Press the "Copy" next to Api Token and keep it somewhere safe. We'll need it soon.

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="mailtrap_token"><ins>mailtrap token</ins></a>: a1bc234d5e6f7890123ghij45678k901</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 8: Setup DNS records for firebase hosting

Follow the guidelines of your domain registrar to configure your DNS in line with the 
<A HREF="#hosting_DNS_records">DNS records</A> specified in the firebase hosting dashboard.

### Example 1: domains.google.com

1. Login into your account on https://domains.google.com
2. Select "DNS"
3. Select "Manage custom records"
4. Create new records with the below information, obviously adjusted in line with your <A HREF="#hosting_DNS_records">DNS records</A>

<table>
    <tr>
      <td>Host name</td>
      <td>Type</td>
      <td>TTL</td>
      <td>Data</td>
    </tr>
    <tr>
      <td>_acme-challenge</td>
      <td>TXT</td>
      <td>N/A</td>
      <td>aBcdE1FghIj23k4lmnoPqrstUvw5xyZabcdeF6GHiJk</td>
    </tr>
    <tr>
      <td></td>
      <td>A</td>
      <td>N/A</td>
      <td>123.123.123.123</td>
    </tr>
    <tr>
      <td></td>
      <td>TXT</td>
      <td>N/A</td>
      <td>hosting-site=thoma5</td>
    </tr>
    <tr>
      <td>www</td>
      <td>CNAME</td>
      <td>N/A</td>
      <td>thoma5.web.app</td>
    </tr>
</table>

### Example 2: squarespace.com

For squarespace, for thoma5.com, this would the be done following these steps:

1. Login into your account on https://www.squarespace.com/
2. Select your domain from your domains and select "Manage domain settings"
3. Edit DNS
4. Add the below records, obviously adjusted in line with your <A HREF="#hosting_DNS_records">DNS records</A>

<table>
    <tr>
      <td>Host</td>
      <td>Type</td>
      <td>Priority</td>
      <td>Data</td>
    </tr>
    <tr>
      <td>_acme-challenge</td>
      <td>TXT</td>
      <td>N/A</td>
      <td>aBcdE1FghIj23k4lmnoPqrstUvw5xyZabcdeF6GHiJk</td>
    </tr>
    <tr>
      <td>@</td>
      <td>A</td>
      <td>N/A</td>
      <td>123.123.123.123</td>
    </tr>
    <tr>
      <td>@</td>
      <td>TXT</td>
      <td>N/A</td>
      <td>hosting-site=thoma5</td>
    </tr>
    <tr>
      <td>www</td>
      <td>CNAME</td>
      <td>N/A</td>
      <td>thoma5.web.app</td>
    </tr>
</table>

**MORE INFO**

<ul>
  <li><a href="https://firebase.google.com/docs/hosting/custom-domain">Connect a custom domain</a></li>
</ul>


---

## Step 9: Setup DNS records for mailtrap

Follow the guidelines of your domain registrar to configure your DNS in line with the 
<A HREF="#mailtrap_DNS_records">DNS records</A> specified in the mailtrap dashboard.

### Example 1: domains.google.com

1. Login into your account on https://domains.google.com
2. Select "DNS"
3. Select "Manage custom records"
4. Create new records with the below information, obviously adjusted with your <A HREF="#mailtrap_DNS_records">DNS records</A>

<table>
  <tr>
    <td>Host name/td>
    <td>Type</td>
    <td>TTL</td>
    <td>Data</td>
  </tr>
  <tr>
    <td>1abcdef2g34hijkl</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td></td>
    <td>TXT</td>
    <td>3600</td>
    <td>v=spf1 include:_spf.smtp.mailtrap.live ~all</td>
  </tr>
  <tr>
    <td>rwmt1._domainkey</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>rwmt1.dkim.smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td>rwmt2._domainkey</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>rwmt2.dkim.smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td>_dmarc</td>
    <td>TXT</td>
    <td>3600</td>
    <td>v=DMARC1; p=none; rua=mailto:dmarc@smtp.mailtrap.live; ruf=mailto:dmarc@smtp.mailtrap.live; rf=afrf; pct=100</td>
  </tr>
  <tr>
    <td>mt-link</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>t.mailtrap.live</td>
  </tr>
</table>

### Example 2: squarespace.com

For squarespace, for thoma5.com, this would the be done following these steps:

1. Login into your account on https://www.squarespace.com/
2. Select your domain from your domains and select "Manage domain settings"
3. Edit DNS
4. Add the below records, obviously adjusted in line with your <A HREF="#mailtrap_DNS_records">DNS records</A>

<table>
    <tr>
      <td>Host</td>
      <td>Type</td>
      <td>Priority</td>
      <td>Data</td>
    </tr>
  <tr>
    <td>1abcdef2g34hijkl</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td>@</td>
    <td>TXT</td>
    <td>3600</td>
    <td>v=spf1 include:_spf.smtp.mailtrap.live ~all</td>
  </tr>
  <tr>
    <td>rwmt1._domainkey</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>rwmt1.dkim.smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td>rwmt2._domainkey</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>rwmt2.dkim.smtp.mailtrap.live</td>
  </tr>
  <tr>
    <td>_dmarc</td>
    <td>TXT</td>
    <td>3600</td>
    <td>v=DMARC1; p=none; rua=mailto:dmarc@smtp.mailtrap.live; ruf=mailto:dmarc@smtp.mailtrap.live; rf=afrf; pct=100</td>
  </tr>
  <tr>
    <td>mt-link</td>
    <td>CNAME</td>
    <td>3600</td>
    <td>t.mailtrap.live</td>
  </tr>
</table>

**MORE INFO**

<ul>
  <li><a href="https://help.mailtrap.io/article/69-sending-domain-setup">Sending Domain Setup - Mailtrap Knowledge Base</a></li>
</ul>

---

## Step 10: Verify mailtrap setup

1. Goto mailtrap.io and sign in with your <a href="#google_account">google account</a>
2. From your dashboard, select Email Sending, then Sending Domains
3. In the domain verification, select Verify all to verify if you've setup your DNS records correctly
4. Follow the steps in Verify Setup, i.e. you'll have to answer some security questions to prove you're building a legit app. In our experience this has been a straightforward process. Questions:
   1) Describe business / project
   2) Website
   3) Linked in profile
   4) What type of emails do you plan to send?
   5) How do you get the list of recipients?
   6) Amount of emails planning to send / month

---

## Step 11: Update firebase

In this step we wil be updating / uploading:

- storage rules
- firestore indexes and rules 
- functions

We have uploaded rules in previous steps during the quick start. 
That was to get up and running quickly. The proper way to update
rules is by using the firebase command line tools, which we will do in
this step.

### Step 11.1: Install firebase command line tools

1. Open cmd
2. Run npm install -g firebase-tools

### Step 11.2: Enable APIs

1. Goto https://cloud.google.com/build/docs/deploying-builds/deploy-firebase
2. Click "Enable the APIs"
3. Follow on screen instructions

### Step 11.3: Enable firebase functions

1. Goto https://console.firebase.google.com
2. Select your project
3. Select functions
4. Press "Get started" and select next

### Step 11.4 Update firebase

1. Run the below (change firebase project and storage bucket to yours)

~~~
mkdir c:\src\apps\thoma5_app_firebase
cd c:\src\apps\thoma5_app_firebase
git clone https://github.com/eliudio/firebase.git
cd c:\src\apps\thoma5_app_firebase\firebase

firebase logout
firebase login
firebase functions:config:set mailtrap.token=a1bc234d5e6f7890123ghij45678k901 mailtrap.sender.email=info@thoma5.com mailtrap.sender.name=Thoma5 app.appname="Thoma5" app.collectionname="order" app.bucket="thoma5" stripe.secret=lalalala --project "thoma5"
firebase deploy --project thoma5

~~~

<i>Where...</i>

<table>
    <tr>
      <td>mailtrap.token</td><td><a href="#mailtrap_token">mailtrap token</td>
    </tr>
    <tr>
      <td>mailtrap.sender.email</td><td>info@thoma5.com</td>
    </tr>
    <tr>
      <td>mailtrap.sender.name</td><td>Thoma5</td>
    </tr>
    <tr>
      <td>app.collectionname</td><td>order</td>
    </tr>
    <tr>
      <td>app.bucket</td><td><a href="#storage_bucket">storage bucket</a></td>
    </tr>
    <tr>
      <td>project</td><td><a href="#firebase_project">firebase project</a></td>
    </tr>
</table>

:exclamation: **NOTES** :exclamation:

- You can use quotes to specify parameters. E.g. You could use sendgrid.apikey="NO KEY"</p>

- In the rules, indexes and functions we cover ALL packages that currently exist. 
  If you only use some packages, then these obsolete rules, indexes and functions could
  be considered obsolete. However, they're harmless being there and it's the easiest 
  way to get going.
     
- When you require your own functions, we recommend to organise multiple functions as described here: https://firebase.google.com/docs/functions/organize-functions?gen=2nd

---

## Step 12: Enable APIs

1. Enable People API: https://console.developers.google.com/apis/api/people.googleapis.com

---

## Step 13: Add Authorized domains to Authentication

The following is required to login with oauth, e.g. when signing in with Apple from your webapp.

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Authenticaiton > Settings
4. In Authorized domains tab, add domain <a href="#domain_name">your domain name</a>, here thoma5.com

---

## Step 14: Configure oauth web client

1. Goto https://console.cloud.google.com/apis/credentials
2. Find the OAuth 2.0 Client IDs with name "Web client". If you find more than one, select any, e.g. the first.
3. Find the "ADD URI" and add these domains:
   - https://thoma5.com
   - https://www.thoma5.com
   - https://thoma5.web.app
4. Find "web client" and copy the client ID
5. Press SAVE

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="web_client_ID"><ins>Web client ID</ins></a>: x-y.apps.googleusercontent.com</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 15: Configure Android Studio project for web

### Step 15.1: Update pubspec.yaml

1. Add the below dependency to pubspec.yaml

~~~
  eliud_pkg_wizards: ^1.0.4
~~~

This will result in your pubspec.yaml file to look like:

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
  eliud_core: ^1.0.7
  eliud_pkg_create: ^1.0.7+1
  eliud_pkg_wizards: ^1.0.4
  eliud_stl_mona: ^1.0.1+6
dev_dependencies:
  flutter_lints: ^2.0.0
  flutter_launcher_icons: ^0.13.1
flutter:
  uses-material-design: true
flutter_icons:
  android: launcher_icon
  ios: false
  image_path: assets/logo/thoma5-logo-1.png

~~~

2. Run pub get

### Step 15.2: Update main.dart

1. Add the following imports to main.dart 

~~~
import 'package:flutter/foundation.dart';
import 'package:eliud_pkg_wizards/wizards_package.dart';
import 'package:eliud_pkg_etc/etc_package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';

~~~

2. Replace the Firebase.initializeApp() line in your main.dart with the below:
   Make sure the values for apiKey -> measurementId correspond with your values available from <a href="#firebaseConfig">firebaseConfig</a>

~~~
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "ABcdEfG_H1Ij2KLmNo3PQ_RstUvwXY4Zabcdefg",
          authDomain: "thoma5.firebaseapp.com",
          projectId: "thoma5",
          storageBucket: "thoma5.appspot.com",
          messagingSenderId: "263405528229",
          appId: "1:123456789012:web:1a2345b6c7890d12ef345h",
          measurementId: "G-WL1A23456C"
        ));
  } else {
    await Firebase.initializeApp();
  }

~~~

3. Add the following extra eliud-dependencies:

~~~
    eliud.registerPackage(WizardsPackage.instance());

~~~

4. So basically your main.dart will look like

~~~
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_model/style/_default/default_style_family.dart';
import 'package:eliud_core/core_package.dart';
import 'package:eliud_pkg_create/creator_package.dart';
import 'package:eliud_pkg_create/tools/basic_app.dart';
import 'package:eliud_pkg_text/text_package.dart';
import 'package:eliud_stl_mona/mona_stl_package.dart';
import 'package:eliud_pkg_create/creator_decoration.dart';
import 'package:eliud_stl_mona/mona_style_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_pkg_wizards/wizards_package.dart';
import 'package:eliud_pkg_etc/etc_package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';
import 'package:eliud_pkg_workflow/workflow_package.dart';

Future<void> main() async {
  String APP_ID = "THOMA5_APP";

  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "ABcdEfG_H1Ij2KLmNo3PQ_RstUvwXY4Zabcdefg",
          authDomain: "thoma5.firebaseapp.com",
          projectId: "thoma5",
          storageBucket: "thoma5.appspot.com",
          messagingSenderId: "263405528229",
          appId: "1:123456789012:web:1a2345b6c7890d12ef345h",
          measurementId: "G-WL1A23456C"
        ));
  } else {
    await Firebase.initializeApp();
  }
  var eliud = Eliud();

  try {
    eliud.registerPackage(CorePackage.instance());
    eliud.registerPackage(TextPackage.instance());
    eliud.registerPackage(MonaStlPackage.instance());
    eliud.registerPackage(CreatorPackage.instance());
    eliud.registerPackage(WizardsPackage.instance());

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

### Step 15.3: Create images and stylesheet

1. Optional: Verify the favicon.png that has been generated before, and optionally create your own (in the web folder). Size is 16 x 16. Use <a href="#logo">logo</a> as input.

2. Download loading.gif 

Download <a href="https://github.com/eliudio/open-resources/raw/main/img/icons/loading.gif">loading.gif</a> and copy into the icons directory of your web folder

3. Download styles.css 

Download <a href="https://github.com/eliudio/open-resources/raw/main/web/styles.css">styles.css</a> and copy into the root directory of your web folder

### Step 15.4: Update index.html

1. Add the stylesheet

~~~
  <link rel="stylesheet" type="text/css" href="styles.css">

~~~

2. Add the <a href="#web_client_ID">Web client ID</a> in metadata

~~~
  <!== Google sign-in -->
  <meta name="google-signin-client_id" content="x-y.apps.googleusercontent.com">

~~~

3. Add the loading gif

~~~
  <div id="progress">
  </div>

  <script>
    var img = document.createElement("img");
    img.className = "center";
    img.src = "icons/loading.gif";
    var src = document.getElementById("progress");
    src.appendChild(img);
  </script>

~~~

4. Initialise pdfjs

~~~
  <script src="https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/build/pdf.js" type="text/javascript"></script>
  <script type="text/javascript">
    pdfjsLib.GlobalWorkerOptions.workerSrc = "https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/build/pdf.worker.min.js";
    pdfRenderOptions = {
      cMapUrl: 'https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/cmaps/',
      cMapPacked: true,
    }
  </script>

~~~

4. Review meta data description and name

5. Which results in the below index.html for thoma5

~~~

<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">

  <link rel="stylesheet" type="text/css" href="styles.css">
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="Thoma5">

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Thoma5">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  
  <!== Google sign-in -->
  <meta name="google-signin-client_id" content="x-y.apps.googleusercontent.com">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="icons/favicon.png"/>

  <title>Thoma5</title>
  <link rel="manifest" href="manifest.json">

  <script>
    // The value below is injected by flutter build, do not touch.
    const serviceWorkerVersion = null;
  </script>
  <!-- This script adds the flutter initialization JS code -->
  <script src="flutter.js" defer></script>
</head>
<body>
  <div id="progress">
  </div>

  <script>
    var img = document.createElement("img");
    img.className = "center";
    img.src = "icons/loading.gif";
    var src = document.getElementById("progress");
    src.appendChild(img);
  </script>

  <script src="https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/build/pdf.js" type="text/javascript"></script>
  <script type="text/javascript">
    pdfjsLib.GlobalWorkerOptions.workerSrc = "https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/build/pdf.worker.min.js";
    pdfRenderOptions = {
      cMapUrl: 'https://cdn.jsdelivr.net/npm/pdfjs-dist@2.12.313/cmaps/',
      cMapPacked: true,
    }
  </script>
  <div id="loading"></div>
  <script>
    window.addEventListener('load', function(ev) {
      // Download main.dart.js
      _flutter.loader.loadEntrypoint({
        serviceWorker: {
          serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: function(engineInitializer) {
          engineInitializer.initializeEngine().then(function(appRunner) {
            appRunner.runApp();
          });
        }
      });
    });
  </script>
</body>
</html>

~~~

---

## Step 16: Cors`

To allow images to be accessed / copied, we need to configure cors access.

1. goto your <a href="#app_root_directory">app root dir</a>
2. create the following file cors.json, make sure to use your <a href="#domain_url">domain url</a> instead of https://thoma5.com

~~~
[
  {
    "origin": ["https://thoma5.com"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
  }
]
~~~

3. run this command and login with your 
~~~
gcloud auth login

~~~

4. run this gsutil command, make sure to replace "thoma5.appspot.com" with your 
storageBucket which you can find from your <a href="#firebaseConfig">firebaseConfig</a>

~~~
gsutil cors set cors.json gs://thoma5.appspot.com

~~~


**MORE INFO**

<ul>
  <li><a href="https://stackoverflow.com/questions/37760695/firebase-storage-and-access-control-allow-origin/37765371">Stackoverflow</a></li>
</ul>
 
---

## Step 17: Deploy your website

1. Create file firebase.json in your app <a href="#app_root_directory">root directory</a> with these contents

~~~
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}

~~~
2. From your <a href="#app_root_directory">app root dir</a>, build and deploy your website

~~~
flutter build web --release --no-tree-shake-icons
rem flutter build web --web-renderer html --release --no-tree-shake-icons
call firebase login
call firebase deploy --project thoma5

~~~

**COMMENT**

When you make code changes, e.g. add package dependencies then you will need to repeat 2. to make your changes available on the web. In other words: no other steps - e.g. CORS - need to be repeated.

We use no-tree-shake-icons during our builds. The icons we use in our app are configured / configurable and hence we can not use tree-shake-icons. More details here.

---

## Step 18: Create policies / policy pages

When publishing apps to the Google Play or Apple App Store, you will need to 
provide links to privacy policy, terms of service and/or disclaimer. 
We recommend providing all 3.

For more information, see <a href="https://github.com/eliudio/eliud_pkg_wizards/raw/main/lib/assets/new_app/legal/policies.pdf">policies.pdf</a>

To create policies, at this stage, you can choose to use your website or your android app. 
We're using the web app as we find the interface easier for the below actions. 
Also, when using the web app we can actually get the URL of the policies easier than with the app.

For each policy, follow these steps:

1. Create a pdf of your policy, then export a jpg for each page and store these files into assets/legal/policy-x-page-b.jpg, ...

2. Open your app. We open <a href="thoma5.com">thoma5.com</a>

3. Login with your <a href="#google_account">google account</a>

4. Run the policy wizard to create a new policy and accept all default values.

5. Open your left drawer and select "drawer1" button

6. In "Current menu items" find the page you've created in 4 and open details

7. In "General" change the Text and Description, e.g. "Privacy Policy" and confirm the change

8. From the left drawer, open the policy

9. Press the button "page" which you can find at the left center of your page and select "Update page"

10. In general change the Description and Title of the page, e.g. "Privacy Policy"

11. Press the button "policyPresentation" which you can find at the left top of your page

12. Click the AppPolicy and then select the Update button

13. Press the Pages button

14. Delete the existing page and add all the you've saved as jpg files in 1.

15. Construct the url: 
    - From your web app: open left drawer, select your policy and copy the URL from your browser address bar
    - From android app: update the policy page, copy the key from the general section. Now construct the URL:
      - Start with https://
      - Add your <a href="#f">domain name</a> and a slash: thoma5.com/
      - Add your <a href="#APP_ID">APP_ID</a> and a slash: #THOMA5_APP/
      - Add the policy page key: 8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy

16. Now repeat for all 3 policies and record the url's

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <ul>
        <li><a name="privacy_policy_url"><ins>Privacy policy URL</ins></a>: <a href="https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy">https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy</a></li>
        <li><a name="terms_of_service_url"><ins>Terms of Service URL</ins></a>: <a href="https://thoma5.com/#THOMA5_APP/9af69563-a90b-47e1-98e1-bbae6d35a041-policy">https://thoma5.com/#THOMA5_APP/9af69563-a90b-47e1-98e1-bbae6d35a041-policy</a></li>
        <li><a name="disclaimer_url"><ins>Disclaimer URL</ins></a>: <a href="https://thoma5.com/#THOMA5_APP/c1470606-b42a-491d-9aa0-c1189189ee78-policy">https://thoma5.com/#THOMA5_APP/c1470606-b42a-491d-9aa0-c1189189ee78-policy</a></li>
      </ul>
    </td>
  </tr>
</table>

---

## Step 19: Create membership dashboard page

A membership dashboard page allows members to request the data that your website / app stores of that person and allows to deactivate the account and destroy all data that we keep of this person.

There are many reasons to have a membership dashboard page. 

- One is because we want to provide our users the best experience possible. And if they like to leave our site, without leaving a trace, then that's what we offer.
- Second is to be in line with regulations.
- Third is because when uploading the app to android play store, we must provide a link to a page to allow actions 

1. Run the memberdashboard wizard (from the usual wizard dialog)
2. Open the memberdashboard. A dialog (!) for the memberdashboard opens. This means that we don't have a page, but have a dialog.
3. Find your dialog ID.
    - From your web app: copy the URL from your browser address bar and find the dialog ID after the last occurance of /
    - From android app: 
      - Press the dialog button
      - Find the key from General section
   Here ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard
4. Run the welcome wizard and create a (blank) page. This page should not be accessible from any menu, i.e. deselect AppBar, Home menu and left and right drawer, but select "Available". The page should open after having been created. However, if for some reason you need to find and open it yourself: open "App" from editor mode, select Pages and find the "Welcome" page. Click the menu next to the page and select "Show page".
5. Update the page so that it's title is "Membership dashboard" and have empty html contents. 
6. Copy the key of the page, here 2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page
7. Now construct the membership URL:
      - Start with https://
      - Add <a href="#domain_name">domain name</a> and a slash: thoma5.com/
      - Add your <a href="#APP_ID">APP_ID</a> and a slash: #THOMA5_APP/
      - Add the membership dashboard page retrieved in step 6, i.e. here 2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page
      - Add a /
      - Add the membership dialog ID, retrieved in step 3, i.e. here ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <ul>
        <li><a name="member_dashboard_url"><ins>Member dashboard URL</ins></a>: <a href="https://thoma5.com/#THOMA5_APP/2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page?open-dialog=ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard">https://thoma5.com/#THOMA5_APP/2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page?open-dialog=ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard</a></li>
      </ul>
    </td>
  </tr>
</table>

8. You should test this URL. Try testing it from a new browser, after having logged out from your site. A dialog will appear to allow to login, after which that membership dashboard will open.

---

## Step 20: Setup oauth consent

TODO

https://console.cloud.google.com/apis/credentials/consent

select user type "External"
select "create"
fill in the details requested:
- provide a logo
- privacy policy will be available from https://[your domain name[/#[app name in code]/privacy_policy-1. In our example: 
 https://juuwle.net/#JUUWLE_APP/privacy_policy-1
- We will make the terms of service available from https://[your domain name[/#[app name in code]/terms_of_service-1. In our example:
 https://juuwle.net/#JUUWLE_APP/terms_of_service-1
- Add your domain as Authorised domains, here juuwle.net
- Specify developers email address
- Add scopes:
 - .../auth/userinfo.email
 - .../auth/userinfo.profil
Then press the "In production" button and go through the on screen instructions

NOTES:
Your app will be available to any user with a Google Account.

You've configured your app in a way that requires verification . To complete verification, you will need to provide:

An official link to your app's Privacy Policy, use #privacy_policy_url
A YouTube video showing how you plan to use the Google user data you get from scopes
A written explanation telling Google why you need access to sensitive and/or restricted user data
All your domains verified in Google Search Console


3.6 You will receive an email "OAuth Verification Request for Project"
Follow instructions in the email

---

## Step 21: Start your free google GCP trial 300 USD

TODO: https://cloud.google.com/free

---

# Chapter III. Create the ios app

- a brief overview of the current base packages

---

## Step 1: Register as apple developer

1. Goto https://developer.apple.com/programs/enroll/
2. Follow the on-screen instructions

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="apple_team_id"><ins>Team ID</ins></a>: 123AB4CDEF</li>
          <li><a name="apple_developer_account_email"><ins>Developer account email</ins></a>: x.y@icloud.com</li>
          <li><a name="apple_developer_account_pw"><ins>Developer account password</ins></a>: password</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 2: Create or Update an Apple App ID

1. https://developer.apple.com/account/resources/identifiers/list
2. Press '+' next to "Identifiers"
3. Select "App IDs" and press continue
4. Select APP and continue
5. Description: <a href="#app_nickname"><ins>your app nickname</ins></a>
6. Explicit bundle ID: Explicit
7. Provide the bundle ID. This is constructed by the invers of <a href="#domain_name">your domain name"</a> + <a href="app_nickname">your app nickname</a> suffixed with 'ios', here com.thoma5.thoma5ios. Do not use '_'
8. Enable "Sign in with Apple". No need to press "Edit"
9. Press "continue"
10. Press "register"

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="app_bundle_id"><ins>App Bunble ID</ins></a>: com.thoma5.thoma5ios</li>
          <li><a name="app_id_prefix"><ins>App ID Prefix</ins></a>: 123AB4CDEF</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 3: Register your apple device

To be able to develop on your ipad / iphone, you need to register your device. Run these steps:

1. https://developer.apple.com/account/resources/devices/list
2. Press '+' next to "Devices"
3. Select your device name, e.g. iOS, iPadOS, ...
4. Provide a device name, e.g. "My dev ipad"
5. Specifiy the UDID of your device

**MORE INFO**

To find the UDID of our devices, this can help...

<ul>
  <li>To find the UDID on macbook: Click apple icon > About This Mac > More Info.. > System Report > Hardware > Hardware Overview and find the UDID next to "Provisioning UDID".</li>
  <li>For other devices we've found <a href="https://deciphertools.com/blog/2014_11_19_how_to_find_your_iphone_udid/">How to Find Your iPhone or iPad's UDID</a> useful.</li>
</ul>

---

## Step 4: Create an Apple Service ID

1. https://developer.apple.com/account/resources/identifiers/list/serviceId
2. Press '+' next to "Identifiers"
3. Select "Services IDs" and press continue
4. Description: <a href="#app_nickname">your app nickname</a>, here Thoma5
5. Identifier: This is constructed by the invers of <a href="#domain_name">your domain name"</a> + <a href="app_nickname">your app nickname</a> suffixed with 'service', here com.thoma5.thoma5service
6. Press save
7. Press register

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="service_description"><ins>Service Description</ins></a>: Thoma5</li>
          <li><a name="service_id"><ins>Service identifier</ins></a>: com.thoma5.thoma5service</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 5: Register a Private Key for you apple developer account

1. https://developer.apple.com/account/resources/authkeys/list
2. Press '+' next to "Keys"
3. Provide key name, here Thoma5
3. Enable "Sign in with Apple"
4. Press "Configure" next to "Sign in with Apple"
5. Select your App ID from the list which corresponds to the <a href="#app_bundle_id"/>App Bunble ID</a> and <a href="#app_id_prefix">App ID Prefix</a>
6. Press "Save"
7. Press "Continue"
8. Press Register
9. Save key ID and download the key

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="key_id"><ins>Key ID</ins></a>: 12ZYXWVUTS</li>
          <li><a name="private_key"><ins>Private key</ins></a>C:\Users\thomas\Downloads\AuthKey_12ZYXWVUTS.p8</li>
        </ul>
      </td>
    </tr>
</table>

10. Press "Done"

---

## Step 6: Enable Apple sign-in on Firestore

1. Goto https://console.firebase.google.com
2. Select your project
3. Select "Authentication"
4. Select "Sign-in method"
5. Press "Add new provider"
6. Select "Apple"
7. Enable it with the switch "Enable"
8. Services ID, specify value of <a href="#service_id">Service ID</a>, here com.thoma5.thoma5service
9.  Apple team ID, find "Team ID" from https://developer.apple.com/account/
10. Expand OAuth code flow configuration
11. Apple team ID, specify value of <a href="#apple_team_id">Team ID</a>, here 123AB4CDEF
12. Key ID, specify value of <a href="#key_id">Key ID</a>, here 12ZYXWVUTS
13. Private key, specify contents of <a name="private_key">Private key</a>
14. Finally copy the authorisation callback URL to be used in the next step

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="authorisation_callback_url">Authorisation callback URL</a>: https://thoma5.firebaseapp.com/__/auth/handler</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 7: Provide Web Authentication Configuration for your Service ID

1. https://developer.apple.com/account/resources/identifiers/list/serviceId
2. Find the service with IDENTIFER = <a href="#service_id">Service identifier</a>
3. Enable "Sign in with Apple"
4. Click Configure next to "Sign in with Apple"
5. Primary App ID: select the app with app that corresponds with the <a href="#app_bundle_id"/>App Bunble ID</a> and <a href="#app_id_prefix">App ID Prefix</a>, here 123AB4CDEF.com.thoma5.thoma5ios
6. Domains and Subdomains: specify <a name="#domain_name">domain name</a>, here thoma5.com
7. Return URLs: specify the <a href="#authorisation_callback_url">Authorisation callback URL</a>, here https://thoma5.firebaseapp.com/__/auth/handler
8. Press "Next"
9. Press "Done"
10. Press "Continue"
11. And finally press "Save"

---

## Step 8: Create Apple firebase app

1. Goto https://console.firebase.google.com
2. Select your project
3. Press "Add app"
4. Select "iOS"
5. Apple bundle ID: <a href="#app_bundle_id">App Bunble ID</a>, here com.thoma5.thoma5ios
6. App nickname: <a href="#app_nickname"><ins>your app nickname</ins></a>, here Thoma5
7. App Store ID (optional): leave blank
8. Press "Register app"
9. Press "Download GoogleService-info.plist"

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="key_id"><ins>Key ID</ins></a>: 12ZYXWVUTS</li>
          <li><a name="googleservice_info_plist"><ins>GoogleService-info.plist</ins></a>C:\Users\thomas\Downloads\GoogleService-info.plist</li>
        </ul>
      </td>
    </tr>
</table>

10. Press "Next", 3 times
11. Press "Continue to the console"

---

## Step 9: Setup ios project

1. Clone your code on your apple machine
2. Open the Android Studio project

---

## Step 10: Configure the Android Studio project for apple

1. From Android Studio, right click your project root directory/ios/Runner.xcworkspace and select Flutter > Open iOS module in Xcode
2. In Xcode, select Runner folder, then from the list of TARGETS, select Runner
3. Then click the "Signing & Capabilities" tab
4. From the team field, select your team
5. For bundle identifier, specify your <a href="#app_bundle_id">App Bunble ID</a>, here com.thoma5.thoma5ios
6. Press "+ Capability"  then double click  "Sign in with Apple"
7. Don't forget to select Team

---

## Step 11. GoogleService-Info.plist

1. Copy <a name="googleservice_info_plist">GoogleService-info.plist</a> from your windows machine to your macbooks, in our case c:\Users\thomas\Downloads\GoogleService-info.plist
2. From Xcode, from project Runner, right click folder Runner and select 'Add Files to "Runner"'
3. Select the file <a name="googleservice_info_plist">GoogleService-info.plist</a> you've copied to your macbook
4. Makes sure “copy items if needed" is checked
5. Press "Add"
6. After adding file, find the entry "REVERSED_CLIENT_ID" and copy it's value
<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="REVERSED_CLIENT_ID"><ins>REVERSED_CLIENT_ID</ins></a>: com.googleusercontent.apps.YOUR REVERSED_CLIENT_ID</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 12. Info.plist

1. Open ios/Runner/Info.plist with a text editor and ...

### Step 12.1. Add a URL scheme to your project

1. Add the below entry, make sure to use your <a name="REVERSED_CLIENT_ID"><ins>REVERSED_CLIENT_ID</ins></a>

~~~
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>[com.googleusercontent.apps.YOUR REVERSED_CLIENT_ID]</string>
			</array>
		</dict>
	</array>

~~~

**MORE INFO**

<ul>
  <li><a href="https://developers.google.com/identity/sign-in/ios/start-integrating">Get Started With Google Sign-in for iOS and macOD</a></li>
</ul>

### Step 12.2. Indicate your app does not use encryption

This is a requirement for app subscription.

~~~
  <key>ITSAppUsesNonExemptEncryption</key>
	<false/>

~~~

**MORE INFO**

<ul>
  <li><a href="https://developer.apple.com/documentation/bundleresources/information_property_list/itsappusesnonexemptencryption">ITSAppUsesNonExemptEncryption</a></li>
</ul>


### Step 12.3. Add camera, microphone and photo library access

1. Add the below entrie

~~~
	<key>NSPhotoLibraryUsageDescription</key>
	<string>This app requires access to the photo library in case you like to add photos to reviews of products.</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>This app requires access to the microphone in case you like to add comments to reviews of products.</string>
	<key>NSCameraUsageDescription</key>
	<string>This app requires access to the camera in case you like to add videos to reviews of products..</string>

~~~

### Step 12.4. Result file

~~~
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>$(DEVELOPMENT_LANGUAGE)</string>
	<key>CFBundleDisplayName</key>
	<string>Juuwle</string>
	<key>CFBundleExecutable</key>
	<string>$(EXECUTABLE_NAME)</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>juuwleios</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>$(FLUTTER_BUILD_NAME)</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>$(FLUTTER_BUILD_NUMBER)</string>
	<key>LSRequiresIPhoneOS</key>
	<true/>
	<key>UILaunchStoryboardName</key>
	<string>LaunchScreen</string>
	<key>UIMainStoryboardFile</key>
	<string>Main</string>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
	<key>UISupportedInterfaceOrientations~ipad</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationPortraitUpsideDown</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
	<key>CADisableMinimumFrameDurationOnPhone</key>
	<true/>
	<key>UIApplicationSupportsIndirectInputEvents</key>
	<true/>
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>com.googleusercontent.apps.x-y</string>
			</array>
		</dict>
	</array>
	<key>ITSAppUsesNonExemptEncryption</key>
	<false/>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>This app requires access to the photo library in case you like to add photos to reviews of products.</string>
	<key>NSMicrophoneUsageDescription</key>
	<string>This app requires access to the microphone in case you like to add comments to reviews of products.</string>
	<key>NSCameraUsageDescription</key>
	<string>This app requires access to the camera in case you like to add videos to reviews of products..</string>
</dict>
</plist>

~~~

---

## Troubleshouting steps

In case you encounter errors whilst running the app, the errors you come across might be one of the following.

1. Issue: Failure of running the app due to processor incompatibility issues.
   Solution: Goto the ios directory and run:

~~~
sudo arch -x86_64 gem install ffi
arch -x86_64 pod install

~~~

2. Error "The operation couldn’t be completed. Unable to launch com.example.x.y.z-icloud.com because it has an invalid code signature, inadequate entitlements or its profile has not been explicitly trusted by the user.” 
   Solution: On your iPhone/tablet open Settings >  General > Device Management > Apple Development: someone@icloud.com then select trust at the top.

3. iOS crash with a stack trace and a message "the default Firebase app has not yet been configured. Add `[FIRApp configure];` (`FirebaseApp.configure()` in Swift) to your application"
   Solution: https://medium.com/vector-com-mm/how-to-fix-ios-crash-during-the-start-firebase-configure-f3477df3154

---

# Chapter IV. Deploy to android store

Below the minimum required (unless indicated) steps to make your app available on android store. As you will see, the app google provides to upload, maintain, test apps is much broader than what we discuss. We do the bare minimum.

## Step 1. Build

1. From your app root directory, run:

~~~
flutter clean
flutter build appbundle --release --no-tree-shake-icons -t lib/main.dart

~~~

2. Record the output file

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="ANDROID_BUNDLE"><ins>Android bundle</ins></a>: build\app\outputs\bundle\release\app-release.aab</li>
        </ul>
      </td>
    </tr>
</table>

---

## Optional: Step 2. Test the bundle

1. Download bundletool from https://github.com/google/bundletool/releases/ and save in c:\dev\bundletool
2. From your app root directory, generate a set of APKs from your app bundle using the bundletool. Make sure to provide the following:
   - --bundle: <a href="#ANDROID_BUNDLE">Android bundle</a>
   - --output: 
   - --ks: <a href="#keystore_filename"><ins>your keystore filename</ins></a>
   - --ks-key-alias: <a href="#keystore_alias"><ins>your keystore alias</ins></a>

~~~
java -jar c:\dev\bundletool\bundletool-all-1.5.0.jar build-apks ^
--bundle=build/app/outputs/bundle/release/app-release.aab ^
--output=build/app/outputs/bundle/release/thoma5.apks ^
--ks=%USERPROFILE%\\.android\\thoma5.keystore ^
--ks-key-alias=thoma5key 

~~~

3. When asked provide your <a href="#keystore_storepass"><ins>your keystore storepass</ins></a>
4. If you've previously installed your app during development on your android device, then remove it.
5. Install the app

~~~
set ANDROID_HOME=C:\Users\johan\AppData\Local\Android\Sdk
java -jar c:\dev\bundletool\bundletool-all-1.5.0.jar install-apks --apks=build/app/outputs/bundle/release/thoma5.apks

~~~

---

## Step 3. Enroll to Android app store 

1. https://play.google.com/console/signup and follow on-screen instructions

---

## Step 4. Create App on Google Play 

1. https://play.google.com/console
2. Push "Create App" button
3. Provide app details and press Create app

---

## Step 5. Provide App policy details

1. https://play.google.com/console
2. Select your app
3. Select "Policy and programmes" > "App content" and then provide details for all declarations that need attention. You will need:
   - <a href="#privacy_policy_url">Privacy policy URL</a>, here <a href="https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy">https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy</a> and press "Save"
   - <a href="#member_dashboard_url">Member dashboard URL</a>: her e<a href="https://thoma5.com/#THOMA5_APP/2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page?open-dialog=ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard">https://thoma5.com/#THOMA5_APP/2ffb7c1e-0a84-4f73-bac9-31c57ffb12c4-page?open-dialog=ecd648b7-68a6-4ebb-94b1-d2211c2f7b8f-member_dashboard</a>

---

## Step 6. Main store listing

### Step 6.1 Create a feature graphic

1. Create a feature graphic PNG or JPG format 1014 x 500

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_feature_graph"><ins>Feature graphic</ins></a>: C:\src\apps\thoma5_app\assets\other\thoma5-feature-graph.png</li>
        </ul>
      </td>
    </tr>
</table>

### Step 6.2 Take screenshots

### Step 6.2.1 Create virtual machines

1. Start Android Studio
2. Select "Tools" > Device Manager
3. Select "Create device"
4. Press "New Hardware Profile" and create the first hardware profile as listed in the table below
5. Press "Next" and select an system image with API level 29
6. Allow all default settings and press "Finish"

| Name                       | Device type  | Screen size | Resolution  | RAM     | Has Hardware Buttons | Has Harware Keyboard | Navigation Style |
|----------------------------|--------------|-------------|-------------|---------|----------------------|----------------------|------------------|
| Phone 16:9                 | Phone/Tablet | 5.96"       | 1440 x 2560 | 2048 MB | /                    | /                    | /                |
| Tablet 7" inch 16:9        | Phone/Tablet | 7"          | 1024 x 576  | 2048 MB | /                    | /                    | /                |
| Tablet 10" inch 16:9       | Phone/Tablet | 10"         | 3200 x 1800 | 2048 MB | /                    | /                    | /                |

### Step 6.2.2 Run the app and take screenshots

1. From Android Studio, run your app on the abvove virtual machines
2. Take take 2-8 screenshots from the phone and 1-8 screenshots from each of the 2 tablets
3. Record the filenames

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_screenshots"><ins>Android screenshots</ins></a>: C:\src\apps\thoma5_app\assets\screenshots\*.jpg</li>
        </ul>
      </td>
    </tr>
</table>

### Step 6.2.3 Create icon 512 x 512 pixels

Provide a <a href="logo>logo</a> png file with resolution 512 x 512

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_logo"><ins>Logo</ins></a>: C:\src\apps\thoma5_app\assets\logo\thoma5-512.png</li>
        </ul>
      </td>
    </tr>
</table>

### Step 6.3 Submit main store listing details

1. https://play.google.com/console
2. Select your app
3. Select "Grow" > "Main store listing"
4. Provide your app name, i.e. <a href="#app_nickname">your app nickname</a>
5. Provide a short and full description
6. Provide your app icon, i.e. <a href="#android_logo">Logo</a>
7. Provide your feature graphic, i.e. <a name="#android_feature_graph">Feature graphic</a>
8. Provide screenshots for phone, 7-inch and 10-inch tablet, i.e. <a href="#android_screenshots">Android screenshots</a>

---

## Step 7. Store settings

1. https://play.google.com/console
2. Select your app
3. Select "Grow" > "Store settings"
4. Press "Edit" in "App category", provide App and select a category, here "Education"
5. Press "Save", then close
6. Press "Edit" in "Store listing contact details" and provide your 
   a. Email address: <a href="#google_account">google account</a>, here thoma5.com.info@gmail.com
   b. Optionally your phone number
   c. Optionally your website, e.g. <a href="#domain_name">your domain</a> prefixed with https://, here https://thoma5.com
7. Press "Save", then close

---

## Step 8. Countries/regions

1. https://play.google.com/console
2. Select your app
3. Select "Release" > "Production"
4. Select "Countries/regions"
5. Select "Add countries/regions"
6. Check All countries
7. Press "Save"

---

## Step 9. Upload for production

1. https://play.google.com/console
2. Select your app
3. Select "Release" > "Production"
4. Press "Create new release"
5. Press "Choose signing key", then select "Use Google-generated key"
6. Press "Upload" from "App bundles" then select your <a href="#ANDROID_BUNDLE">Android bundle</a>, here build\app\outputs\bundle\release\app-release.aab
7. Provide a release name, e.g. "1 (1.0.0)"
8. Provide release notes, e.g.

~~~
<en-GB>
First release
</en-GB>

~~~

9. Press "Next"
10. Press "Save"

---

## Step 10: Sign in

In the previous step we've used the Google-generated key as signing key.
This changes the SHA-1 certifcate fingerprint to their own.
So, we need to copy that SHA1 key into our firebase configuration.

1. Goto https://play.google.com/console
2. Select your app
3. Goto Release > Setup > App signing
4. Find the SHA-1 certificate fingerprint in the "App signing key certificate" section and copy it.
5. Goto https://console.firebase.google.com
6. Select your project
7. Press "Project Overview" > "Settings (gear box)" and select "Project settings"
8. From the "General" tab > "Your apps" press "Add fingerprint" and paste the SHA-1 from step 4.

---

## Step 11: Publishing overview

1. Press the "Send n changes for review"
2. Congratulations. Now you just have to wait for approval. In our case this took 6h. You'll receive an email. 

---

# Chapter V. Deploy to apple store

## Step 1: Enroll for the Apple Developer Program.

1. Goto https://developer.apple.com/programs/enroll/ and follow onscreen instructions to enroll for the Apple Developer Program.

---

## Step 2: Create an app on App Store Connect

1. https://appstoreconnect.apple.com/apps
2. Select '+' and select 'New app'
3. Specify new app details:
   - Platforms: iOS
   - Name: <a href="#app_nickname">your app nickname</a>, here Thoma5
   - Primary language: choose your language, we've chosen English (UK)
   - Bundle ID: select your <a href="#app_bundle_id"/>App Bunble ID</a>, here com.thoma5.thoma5ios
   - SKU: copy your bundle ID, here com.thoma5.thoma5ios
   - User Access: Full Access

---

## Step 3: Provide App Information

1. https://appstoreconnect.apple.com/apps
2. Select your app
3. Press General > App Information
4. Specify Category, here Education
5. Specify Content Rights, select 'No, it does not contain, show, or access third-party content'
6. Specify Age Ratings
   - select 'NONE' for all entries of 'APPLE CONTENT DESCRIPTION'
   - specify 'No, this app doesn't contain unrestricted web access'
   - specify 'No, this app doesn't contain instances of gambling'
7. Select 'Restrict to 17+'
8. Press 'save'

---

## Step 4: Create a build archive 

1. Goto your android studio directory and run these statements

~~~
cd ios
flutter build ipa --no-tree-shake-icons

~~~

---

## Step 5: Upload to App Store Connect

### Option 5.1: Use upload tool

1. Create a key
   1. https://appstoreconnect.apple.com
   2. Press 'Users and Access'
   3. Select 'Keys' tab
   4. Press '+' to add a key
   5. Enter a name, here Thomas
   6. Select 'developer' as access
   7. Press 'generate'
   8. Press the 'download' button, then copy the file into your project directory/private_keys
   9. Copy the Issuer ID from the page (near the top) and make note
   10. Copy the KEY ID and make note

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="ISSUER_ID"><ins>Issuer ID</ins></a>: ab1cde23-a1bc-a1bc-a1bc-ab1cde23</li>
          <li><a name="KEY_ID"><ins>KEY ID</ins></a>: ABC1DE23FG</li>
          <li><a name="PRIVATE_KEY_DIR"><ins>Private key directory</ins></a>: /Users/thomas/src/myprojects/apps/thomas5_app/ios/private_keys</li>
        </ul>
      </td>
    </tr>
</table>

2. Run the below command, change the your_api_key and your_issuer_id

~~~
xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey your_api_key --apiIssuer your_issuer_id

~~~

**MORE INFO**

<ul>
  <li><a href="https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api">Creating API Keys for App Store Connect API</a></li>
</ul>

### Option 5.2: Use transport app

1. Install and open 'Apple Transport app' on your mac
2. Drag and drop the build/ios/ipa/*.ipa app bundle onto the 'Apple Transport app'

---

## Step 6: Take screenshots

## Step 6.1: Create simulators 

To be able to create screenshots for app sumission, we need to create iOS simulators.

1. Open your project in xcode
2. From xcode, select menu Xcode > Open Developer Tool > Simulator
3. From the Simulator, select File > New Simulator and create simulators for the iOS simulator Device types listed below. Use one of the latest OS!

<table>
    <tr>
      <td>App Store Connect device type</td>
      <td>iOS simulator Device type</td>
    </tr>
    <tr>
      <td>iPhone 6.7"</td>
      <td>iPhone 14 Pro Max</td>
    </tr>
    <tr>
      <td>iPhone 6.5"</td>
      <td>iPhone 11 Pro Max</td>
    </tr>
    <tr>
      <td>Phone 5.5"</td>
      <td>iPhone 8 Plus</td>
    </tr>
    <tr>
      <td>iPad pro (6th gen) 12.9" Display</td>
      <td>iPad Pro (12.9-inch) (6th generation)</td>
    </tr>
    <tr>
      <td>iPad pro (2nd gen) 12.9" Display</td>
      <td>iPad Pro (12.9-inch) (2nd generation)</td>
    </tr>
</table>

---

## Step 6.2 Create screenshots

For each of the simulators created in the previous step, do this:

1. From the simulator application, run the simulator
2. From Android studio, select the simulator as the device, then press run
3. Press the camera button from the simulator and save the screenshot
4. Record the filenames

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="ios_screenshots"><ins>iOS screenshots</ins></a>: /src/.../thoma5_app/assets/screenshots\*.jpg</li>
        </ul>
      </td>
    </tr>
</table>

5. Close the simulator afterwards

---

## Step 7: Create test user

1. For submission to the Apple App Store, we need to provide a login and password. Create a test account on icloud and store login and password

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="test_icloud_account"><ins>Test icloud account</ins></a>: *****@icloud.com</li>
          <li><a name="test_icloud_password"><ins>Password</ins></a>: *****</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 8: Provide App Privacy details

1. https://appstoreconnect.apple.com/apps
2. Select your app
3. Select 'General' > 'App Privacy'
4. In Privacy Policy, press 'Edit'
5. Provide <a href="#privacy_policy_url">Privacy policy URL</a>, here <a href="https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy">https://thoma5.com/#THOMA5_APP/8a75d3fa-d8e9-4ac8-9eb7-851010807502-policy</a>
6. Press 'Get Started' and follow on-screen instructions / questions
7. Depending on the answers, you now might need to setup variuous data types in App Privacy
8. Press 'Publish' and confirm

---

## Step 9: Pricing and Availability

1. https://appstoreconnect.apple.com/apps
2. Select your app
3. Select 'General' > 'Pricing and Availability'
4. In Price Schedule, press 'Add Pricing' and select Base Country and Price, i.e. 0 and save
5. In App Availablity specify where you want your app to be available.

---

## Step 10: Submit the app

1. https://appstoreconnect.apple.com/apps
2. Select your app
3. Select "Prepare for Submission"
4. Upload <a href="#ios_screenshots"><ins>iOS screenshots</ins></a>
5. Specify Description
5. Specify Keywords
6. Specify Support URL = <a href="#domain_name">your domain</a>, prefixed with https://, here https://thoma5.com
7. Specify Marketing URL = <a href="#domain_name">your domain</a>, prefixed with https://, here https://thoma5.com
8. In Build select the build you've uploaded in previous step
9. In App Review Information, specify sign-in required <a href="#test_icloud_account">Test icloud account</a> and <a href="#test_icloud_password">Password</a>
10. Press 'Save'
11. Press 'Add for Review'
12. Press 'Submit to App Review'
   
---

# Chapter VI. Extend the app with other packages

TODO

Include extra packages and run wizards. For example, for thoma5 we added:
    eliud.registerPackage(ChatPackage.instance());
    eliud.registerPackage(FeedPackage.instance());
    
See <a href="#overview_packages">overview</a> of and <a href="#links_packages">links</a> to all currently known packages below. 

---

# Chapter VII. Write and integrate your own code / packages

TODO

---

# Appendix A. Overview packages

## The dependencies of a typical app <a name="overview_packages"></a>

A typical app, here Minkey, uses the following dependencies:

![Dependency diagram](https://github.com/eliudio/eliud_core/raw/main/minkey-depends.jpg)

---

## Links <a name="links_packages"></a>

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

---
