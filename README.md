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

The below steps document the creation of your own android + apple + web app and includes all instructions, all the way to pushing your app into the apple app store, android store and web. 

## Example Eliud apps

These are some example apps which demonstrate what eliud can give you. Everything used is open source, part of eliud project.

|                                                                                         | App                                            | Ios                                                                          |Android                                                                                      | Web                                                    |
| ---------------------------------------------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------- |-------------------------------------------------------------------------------------------- |------------------------------------------------------- |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/juuwle-logo-128.jpg) | Juuwle - An online store for jewels            | [Juuwle on the App Store](https://apps.apple.com/us/app/juuwle/id6449458929) |[Juuwle on Google Play](https://play.google.com/store/apps/details?id=net.juuwle.juuwle)    | [https://juuwle.net](https://juuwle.net)              |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/minkey-logo-128.png) | Minkey - Community making apps online          | This type of app is not allowed on apple store                               | [Minkey on Google Play](https://play.google.com/store/apps/details?id=io.minkey.minkey_app)| [https://minkey.io](https://minkey.io)                |
| ![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/thoma5-logo-128.png) | Thoma5 - Profile of Thomas. Under construction | In development                                                               | In development                                                                             | [https://thoma5.com](https://thoma5.com)              |

---

# I. Quick start

This guide are all steps to create a minimum android, iOS or web app with Eliud.

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>Whenever this pops up, make note of this for what this is in your case, as you'll need it at some later stage. In the below text we provided this information whilst creating thoma5. Obviously for sensitive information, like passwords, we've provided fake info.</td>
    </tr>
</table>

---

## Step 1: Create a new google account

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

## Step 2: Create a new firebase project

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

## Step 3: Configure your project

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Project Overview > Project settings
4. Select support email. Use your <a href="#google_account">google account</a>

---

## Step 4: Setup Firebase database

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

## Step 5: Setup Firebase storage

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

## Step 6: Setup Google Authentication

1. Goto https://console.firebase.google.com
2. Select your project
3. Select Authentication
4. Select Sign-in method
5. Select Google from Sign-in providers
6. Enable the Google sign-in

---

## Step 7: Generate key

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

## Step 8: Add Firebase Android App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Android'"
4. Specify your android package name
5. Specify your android app nickname
6. Paste the SHA-1 key <a href="#keystore_SHA1">Your keystore SHA1</a>
7. Press "Register app"
8. Then download the file google-services.json

<table>
    <tr>
      <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
      <td>
        <ul>
          <li><a name="android_package_name"><ins>your Android app package name</ins></a>: com.thoma5.thoma5_app</li>
          <li><a name="android_app_nickname"><ins>your Android app nickname</ins></a>: Thoma5</li>
          <li><a name="google_services_json_filename"><ins>your downloaded google-services.json file</ins></a>: C:\Users\johan\Downloads\google-services.json</li>
        </ul>
      </td>
    </tr>
</table>

---

## Step 9: Create Android Studio project

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

## Step 10: Copy google_services.json

1. Switch to the Project view in Android Studio to see your project root directory.
2. Move <a href="#google_services_json_filename">your downloaded google-services.json file</a> into your module (app-level) root directory, e.g. thoma5_app/android/app

---

## Step 11: Apply firebase SDK instructions

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


    implementation 'com.google.firebase:firebase-analytics'


    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
}

~~~

---

## Step 12: Add key store file to your project

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

## Step 13: Update pubspec.yaml

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

## Step 14: Update main.dart

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

## Step 15: Clean up

1. Delete the directory test, which contains widget_test.dart

---

## Step 16: minSdkVersion

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

## Step 17: Run your app

1. Run the app. Because this is the first time your start the app, it will install a basic app. 
2. When the app asks to choose an account to login, select your <a href="#google_account">google account</a>
3. Ones the basic app is created, it will open

---

## Step 18: Add some basic functionality to your app

1. After you've started your app in the previous step, a "Hello world" screen should appear.
2. Press the pen icon ![Pen](https://github.com/eliudio/open-resources/raw/main/img/icons/edit.png) to toggle editing mode on.
3. Then press the ![Pen](https://github.com/eliudio/open-resources/raw/main/img/icons/edit.png) - app button and in the general section change the title of your application
4. When in edit mode, press the wizard icon ![Wizard](https://github.com/eliudio/open-resources/raw/main/img/icons/wizard.png) to open the wizard dialog box.
5. We have only activated a few packages in the code (using eliud.registerPackage), so hence not many wizards are initially available. 
   1. Select signinbutton and press Go!
   2. Then select signoutbutton and press Go!

---

# Next steps

In the previous steps we've done the foundation to build an app. The next steps introduces 
- platforms: web deployment, apple app
- authentication
- a brief overview of the current base packages
- functions to support packages
- deployment: deploying to google play store and apple app store,

---

## Step 19: Logo

1. create a logo and store into a file in your project directory, e.g. assets/logo/thoma5-logo-1.png

2. add the below to pubspec.yaml

~~~
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_icons: 
  android: launcher_icon
  ios: false
  image_path: assets/logo/thoma5-logo-1.png

~~~

3. Run the below from your 

~~~
flutter pub run flutter_launcher_icons:main

~~~

---

## Step 20: Add Firebase Web App

1. Goto https://console.firebase.google.com
2. Select your project
3. Click 'Add app' and select platform 'Web'"
4. Provide an App nickname, e.g. Thoma5
5. Select Firebase Hosting. 
6. Select your project from the drop down box. 
7. Click on Register app. 
8. From the Hosting dashboard, find the "Add custom domain" button and add
   - thoma5.com
   - www.thoma5.com, and configure to redirect to thoma5.com
9. Make note of the DNS records. We'll need this in a later step.

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td width="100">
      <ul>
        <li><A name="hosting_DNS_records">DNS records</A></li>
        <li>Domain: thoma5.com</li>
        <li>
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
              <td>aBcdE1FghIj23k4lmnoPqrstUvw5xyZabcdeF6GHiJk</td>
            </tr>
          </table>
        </li>
        <li>Domain: www.thoma5.com</li>
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
        </li>
      </ul>
    </td>
  </tr>
</table>

---

## Step 21: Buy domain

1. Buy a domain name, e.g. on squarespace.com. 

---

## Step 22: Setup email forwarding

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

## Step 23: Subscribe to mailtrap

1. https://mailtrap.io/
2. Select sign up
3. Select "Use google account" and select your <a href="#google_account">google account</a>
4. Select "Email Sending", enter your domain and press "Add Your DomaiN"
5. Make note of the DNS records. We'll need this in a later step.

<table>
  <tr>
    <td width="60"><img src="https://github.com/eliudio/open-resources/raw/main/img/icons/writing-hand.png"/></td>
    <td>
      <table>
        <tr>
          <A name="mailtrap_DNS_records">DNS records</A>
        </tr>
        <tr>
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
                <td>Domain Verification</td>
                <td>CNAME</td>
                <td>1abcdef2g34hijkl</td>
                <td>smpt.mailtrap.live</td>
              </tr>
              <tr>
                <td>Missing</td>
                <td>SPF</td>
                <td>TXT</td>
                <td>-</td>
                <td>v=spf1 include:_spf.smtp.mailtrap.live ~all</td>
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
                <td>v=DMARC1; p=none; rua=mailto:dmarc@smtp.mailtrap.live; ruf=mailto:dmarc@smtp.mailtrap.live; rf=afrf; pct=100</td>
              </tr>
              <tr>
                <td>Missing</td>
                <td>Custom domain tracking</td>
                <td>CNAME</td>
                <td>mt-link</td>
                <td>t.mailtrap.live</td>
              </tr>
            </table>
          </td>
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

## Step 24: Setup DNS records for firebase hosting

Follow the guidelines of your domain registrar to configure your DNS in line with the 
<A HREF="#hosting_DNS_records">DNS records</A> specified in the firebase hosting dashboard.

### Example 1: domains.google.com

1. Login into your account on https://domains.google.com
2. Select "DNS"
3. Select "Manage custom records"
4. Create new records with the below information

<table>
    <tr>
      <td>Host name/td>
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
4. Add the below records

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

## Step 25: Setup DNS records for mailtrap

Follow the guidelines of your domain registrar to configure your DNS in line with the 
<A HREF="#mailtrap_DNS_records">DNS records</A> specified in the mailtrap dashboard.

### Example 1: domains.google.com

1. Login into your account on https://domains.google.com
2. Select "DNS"
3. Select "Manage custom records"
4. Create new records with the below information

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
4. Add the below records
<table>
TODO: construct from looking at example 1 above and example 1 and 2 in DNS record setup for hosting
</table>

**MORE INFO**

<ul>
  <li><a href="https://help.mailtrap.io/article/69-sending-domain-setup">Sending Domain Setup - Mailtrap Knowledge Base</a></li>
</ul>

---

## Step 26: Verify mailtrap setup

1. Goto mailtrap.io and sign in with your <a href="#google_account">google account</a>
2. From your dashboard, select Email Sending, then Sending Domains
3. In the domain verification, select Verify all to verify if you've setup your DNS records correctly
4. Follow the steps in Verify Setup, i.e. you'll have to answer some security questions to prove you're building a legit app. In our experience this has been a straightforward process. Questions:
   1) Describe business / project
   2) Website
   3) Linked in profile
   4) What type of emails do you plan to send?
   5) How do youy get the list of recipients?
   6) Amount of emails planning to send / month

---

## Step 27: Update firebase

In this step we wil be updating / uploading:

- storage rules
- firestore indexes and rules 
- functions

We have uploaded rules in previous steps during the quick start. 
That was to get up and running quickly. The proper way to update
rules is by using the firebase command line tools, which we will do in
this step.

### Step 27.1: Install firebase command line tools

1. Open cmd
2. Run npm install -g firebase-tools

### Step 27.2: Enable APIs

1. Goto https://cloud.google.com/build/docs/deploying-builds/deploy-firebase
2. Click "Enable the APIs"
3. Follow on screen instructions

### Step 27.3: Enable firebase functions

1. Goto https://console.firebase.google.com
2. Select your project
3. Select functions
4. Press "Get started" and select next

### Step 27.4 Update firebase

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

## Step 28: Enable APIs

1. Enable People API: https://console.developers.google.com/apis/api/people.googleapis.com

---

## Step 29: Configure oauth web client

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

## Step 30: Configure Android Studio project for web

TODO: See currently changed uncommitted stuff (visual code)
1. Change index.html, include the client ID in metadata!
   <a href="#web_client_ID">web client ID</a>
2. Update favicon.png
3. Change main.dart
4. Create file firebase.json in your app <a href="#app_root_directory">root directory</a> with these contents

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
4. Build web:

~~~
flutter build web --web-renderer html --release --no-tree-shake-icons
call firebase login
call firebase deploy --project thoma5

~~~

---

## Step 31: Create policies and membership page

1. Add the below dependency to pubspec.yaml

~~~
  eliud_pkg_wizards: ^1.0.3+6
~~~

2. Run pub get
3. Add the following import to main.dart
~~~
import 'package:eliud_pkg_wizards/wizards_package.dart';
import 'package:eliud_pkg_etc/etc_package.dart';
import 'package:eliud_pkg_medium/medium_package.dart';

~~~
4. Add the following line to register the wizards package
~~~
    eliud.registerPackage(WizardsPackage.instance());

    // needed for WizardsPackage:
    eliud.registerPackage(EtcPackage.instance());
    eliud.registerPackage(MediumPackage.instance());

~~~
5. Restart your app
6. Run policy wizard
Also see policies.txt, i.e. copy this here (or reference!)

-> update the pages, use the examples C:\src\apps\thoma5_app\assets\legal
   -> I've uploaded these to drive, so can be accessed from tablet

-> construct the url

ANCHOR : privacy_policy_url
ANCHOR : terms_of_service_url
ANCHOR : disclaimer_url

7. Create memberdashboard page

- How to create a membership page to allow to open the membership dialog
- example: https://minkey.io/#MINKEY_APP/d33da4b8-7179-4fac-b8db-ddc997c2d61a?open-dialog=member_dashboard)
- create an empty page
  - Description "Blank"
  - Title "Welcome"
  - copy the ID, here: b038a344-5762-4880-9767-d89f164811d7
- open member dashboard and copy the url, here: https://juuwle.net/#JUUWLE/member_dashboard
- now construct the URL:
  https://juuwle.net/#JUUWLE/b038a344-5762-4880-9767-d89f164811d7?open-dialog=member_dashboard

ANCHOR : member_dashboard_url

---

## Step 32: Setup oauth consent

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

## Step n: see create-new-app-removed-whats-put-in-README.txt

---

# overview packages / dependencies

## typical
A typical app, here Minkey, uses the following dependencies:

![Dependency diagram](https://github.com/eliudio/eliud_core/raw/main/minkey-depends.jpg)

---

## links
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
