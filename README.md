# eliud

## What is eliud?

- Eliud technology is open source technology. 
- The technology allows to build apps and/or websites. Today, app content can include photo galleries, pages with videos and images (html), social media, chat with or between members, your shop / shopping cart, photo sliders, documents, and more. A complete list below.
- Eliud is a layer on top of Flutter. Flutter is an open-source UI software development kit created by Google. Flutter allows to develop cross platform applications for iOS, Android and web as well as Linux, macOS, Windows and Google Fuchsia.
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

|App name|Description                         |Ios                                                                         |Android                                                                                     | Web                                                   |
|--------|------------------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|-------------------------------------------------------|
|Juuwle  |An online store for jewels          |[Juuwle on the App Store](https://apps.apple.com/us/app/juuwle/id6449458929)|[Juuwle on Google Play](https://play.google.com/store/apps/details?id=net.juuwle.juuwle)    | [https://juuwle.net](https://juuwle.net)              |
|Minkey  |Community making apps online        |This type of app is not allowed on apple store                              | [Minkey on Google Play](https://play.google.com/store/apps/details?id=io.minkey.minkey_app)| [https://minkey.io](https://minkey.io)                |
|Thoma5  |Profile of Thomas. Uner construction|In development                                                              | In development                                                                             | [https://thoma5.com](https://thoma5.com)              |

## eliud cookbook
In this cookbook we will create a new app from scratch. We assume you're building an app for web, android and ios. Skip what doesn't apply to you.

### preparations
#### 1. decide on the following

#### 2. buy google domain

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
|[eliud_core](https://pub.dev/packages/eliud_core)                          | This package, the core package                        |
|[eliud_pkg_wizards](https://pub.dev/packages/eliud_pkg_wizards)            | Eliud wizards package                                 |
|[eliud_pkg_chat](https://pub.dev/packages/eliud_pkg_chat)                  | Eliud chat package                                    |
|[eliud_pkg_create](https://pub.dev/packages/eliud_pkg_create)              | Eliud create package                                  |
|[eliud_pkg_etc](https://pub.dev/packages/eliud_pkg_etc)                    | Eliud etc package                                     |
|[eliud_pkg_feed](https://pub.dev/packages/eliud_pkg_feed)                  | Eliud feed package                                    |
|[eliud_pkg_follow](https://pub.dev/packages/eliud_pkg_follow)              | Eliud follow package                                  |
|[eliud_pkg_fundamentals](https://pub.dev/packages/eliud_pkg_fundamental)   | Eliud fundamentals package                            |
|[eliud_pkg_medium](https://pub.dev/packages/eliud_pkg_medium)              | Eliud medium package                                  |
|[eliud_pkg_membership](https://pub.dev/packages/eliud_pkg_membership)      | Eliud membership package                              |
|[eliud_pkg_notifications](https://pub.dev/packages/eliud_pkg_notifications)| Eliud notifications package                           |
|[eliud_pkg_pay](https://pub.dev/packages/eliud_pkg_pay)                    | Eliud pay package                                     |
|[eliud_pkg_shop](https://pub.dev/packages/eliud_pkg_shop)                  | Eliud shop package                                    |
|[eliud_pkg_text](https://pub.dev/packages/eliud_pkg_text)                  | Eliud text package                                    |
|[eliud_pkg_wizards](https://pub.dev/packages/eliud_pkg_wizards)            | Eliud wizards package                                 |
|[eliud_pkg_workflow](https://pub.dev/packages/eliud_pkg_workflow)          | Eliud workflow package                                |
|[eliud_stl_mona](https://pub.dev/packages/eliud_stl_mona)                  | Eliud mona style                                      |
|[eliud_generator](https://pub.dev/packages/eliud_generator)                | Eliud generator                                       |
|[eliud_pkg_apps](https://pub.dev/packages/eliud_pkg_apps)                  | Eliud package for creating apps through code, not gui |
