/*
 Bespoke code Firestore implementation. This differs from generated Firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';
import 'dart:io';

import 'package:eliud_core/tools/image_formfield.dart';
import 'package:eliud_core/model/image_model.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

import 'package:eliud_core/tools/file_tools.dart';

class ImageTools {
  static String FIREBASE_STORAGE_DIRECTORY = 'mydirectory';

/*
  static Future<ImageModel> createThumbnail(ImageModel model, String name, img.Image image) async {
    var documentID = model.documentID;
    var thumbNailImage = img.copyResize(image, width: 200);
    File _thumbNailFile;
    _thumbNailFile = File('${(await getTemporaryDirectory()).path}/$documentID.thumbnail.$basenameWithoutExtension.png')..writeAsBytesSync(img.encodePng(thumbNailImage));
    var thumbNailFileName = FIREBASE_STORAGE_DIRECTORY + '/' + model.documentID + '.thumbnail.' + name + '.png';
    var firebaseStorageRefThumbNail = FirebaseStorage.instance
        .ref().child(thumbNailFileName);
    var uploadTaskThumbNail = firebaseStorageRefThumbNail
        .putFile(_thumbNailFile);
    return await uploadTaskThumbNail.then((onValue) async {
      return await firebaseStorageRefThumbNail.getDownloadURL().then((valThumbNail) {
        return model.copyWith(imageURLThumbnail: valThumbNail);
      });});
  }

  static Future<img.Image> downloadImage(String url, String fileName) async {
    try {
      return await FileTools.downloadFile(url, fileName).then((value) async {
          return img.decodeImage(value.readAsBytesSync());
      }).catchError((onError) =>
      null);
    } catch (error) {
      return null;
    }
  }

  static Future<ImageModel> uploadPic(ImageModel model) async {
    try {
      var localFile = ImageFieldHelper.localFileName(model.imageURLOriginal);
      if (localFile != null) {
        var _originalImage = File(localFile);
        var baseName = context.basename(localFile);
        var basenameWithoutExtension = context.basenameWithoutExtension(localFile);
        var image = img.decodeImage(_originalImage.readAsBytesSync());
        var originalFileName = FIREBASE_STORAGE_DIRECTORY + '/' + model.documentID + '.' + baseName;
        var firebaseStorageRefOriginal = FirebaseStorage.instance
            .ref().child(originalFileName);
        var uploadTaskOriginal = firebaseStorageRefOriginal
            .putFile(_originalImage);
        return await createThumbnail(model, basenameWithoutExtension, image).then((model) async {
          return await uploadTaskOriginal.then((onValue) async {
            return await firebaseStorageRefOriginal.getDownloadURL().then((
                valOriginal) async {
              return model.copyWith(imageURLOriginal: valOriginal);
            });
          });
        });
      } else {
        if (model.source == SourceImage.SpecifyURL) {
          var name = model.documentID;
          return await downloadImage(model.imageURLOriginal, name).then((image) async {
            return await createThumbnail(model, name, image).then((model) async {
              return model;
            });
          });
        } else {
          return model;
        }
      }
    }
    catch (onError) {
      print(onError);
      return model;
    }
  }
*/
}
