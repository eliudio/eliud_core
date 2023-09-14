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
|                                                                                        | App                                          |Ios                                                                         |Android                                                                                     | Web                                                   |
|----------------------------------------------------------------------------------------|----------------------------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|-------------------------------------------------------|
|![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/juuwle-logo-128.jpg)|Juuwle - An online store for jewels           |[Juuwle on the App Store](https://apps.apple.com/us/app/juuwle/id6449458929)|[Juuwle on Google Play](https://play.google.com/store/apps/details?id=net.juuwle.juuwle)    | [https://juuwle.net](https://juuwle.net)              |
|![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/minkey-logo-128.png)|Minkey - Community making apps online         |This type of app is not allowed on apple store                              | [Minkey on Google Play](https://play.google.com/store/apps/details?id=io.minkey.minkey_app)| [https://minkey.io](https://minkey.io)                |
|![Logo](https://github.com/eliudio/open-resources/raw/main/img/logo/thoma5-logo-128.png)|Thoma5 - Profile of Thomas. Under construction|In development                                                              | In development                                                                             | [https://thoma5.com](https://thoma5.com)              |

## Quick start

This guide are all steps to create a minimum android, iOS or web app with Eliud.

> &#128221; Whenever this note pops up in the below text, make note of this for what this is in your case, as you'll need it at some later stage.

### Step 1: Create a new google account

1. Goto https://www.google.com/account/about/
2. Select "Create an account"
3. Follow on screen instructions 
(recommended to use default settings)

> &#128221; <a name="google_account">google account</a>: thoma5.com.info@gmail.com, password ...

### Step 2: Create a new firebase project

1. Goto https://console.firebase.google.com
2. Select "Create a project"
3. And follow on screen instructions 
(recommended to use default settings)

> &#128221; <a name="firebase_project">firebase project</a>: thoma5

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

### Step 8: Generate key

        keytool -genkey -v -keystore your_keystore_filename -storepass your_keystore_storepass -alias your_keystore_alias -keypass your_keystore_keypass -keyalg RSA -keysize 2048 -validity 36524


> &#128221;
> <p><a name="your_keystore_filename">Your keystore filename</a>: your_keystore_filename</p>
> <p><a name="your_keystore_storepass">Your keystore storepass</a>: your_keystore_storepass</p>
> <p><a name="your_keystore_keypass">Your keystore keypass</a>: your_keystore_keypass</p>
> <p><a name="your_keystore_alias">Your keystore alias</a>: your_keystore_alias</p>

### Step 7: Create Android Studio project

-----




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
