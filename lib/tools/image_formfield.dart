import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:eliud_core/model/image_model.dart';

typedef ChangeImageField(String url);

const String DEFAULT_IMAGE =
    "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";

class ImageFieldHelper {
  static String localFileName(String imageURL) {
    if (imageURL.startsWith("local:")) return imageURL.substring(6);
    return null;
  }
}

class ImageField extends StatefulWidget {
  final SourceImage source;
  final String imageURL;
  final ChangeImageField trigger;

  ImageField(this.source, this.imageURL, this.trigger);

  @override
  createState() {
    return new ImageFieldState(imageURL: imageURL);
  }
}

class ImageFieldState extends State<ImageField> {
  String imageURL;
  final TextEditingController _urlController = TextEditingController();

  ImageFieldState({this.imageURL});

  @override
  void initState() {
    super.initState();
  }

  void _onChanged(val) {
    widget.trigger(val);
    setState(() {
      imageURL = val;
    });
  }

  bool isLocal() {
    return (ImageFieldHelper.localFileName(imageURL) != null);
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          imageURL = "local:" + image.path;
          widget.trigger(imageURL);
        });
      }
    }

    Future<void> crop() async {
      File image = await ImageCropper.cropImage(
          sourcePath: ImageFieldHelper.localFileName(widget.imageURL),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop image',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      if (image != null) {
        setState(() {
          imageURL = "local:" + image.path;
          widget.trigger(imageURL);
        });
      }
    }

    double width = fullScreenWidth(context);
    double height = fullScreenHeight(context);

    double fullWidth = (width < height ? width : height) - 56;

    List<Widget> widgets = List();
    if (widget.source == SourceImage.Upload) {
      String localFileName = ImageFieldHelper.localFileName(widget.imageURL);
      List<Widget> buttons = List();
      if (GlobalData.memberIsOwner()) {
        buttons.add(IconButton(
            icon: Icon(Icons.add_a_photo),
            tooltip: "Select a photo",
            onPressed: () {
              getImage();
            }));
      }
      if (isLocal()) {
        // Allow a new image to be cropped. This hasn't been uploaded yet
        buttons.add(IconButton(
            icon: Icon(Icons.crop),
            tooltip: "Crop",
            onPressed: () {
              crop();
            }));
      }

      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              child: new SizedBox(
                width: fullWidth,
                //height: fullWidth,
                child: (localFileName != null)
                    ? Image.file(
                        new File(localFileName),
                        fit: BoxFit.fill,
                      )
                    : (imageURL != null)
                        ? ImageHelper.getImageFromURL(
                            url: imageURL,
                            fit: BoxFit.fill,
                          )
                        : ImageHelper.getImageFromURL(
                            url: DEFAULT_IMAGE,
                            fit: BoxFit.fill,
                          ),
              ),
            ),
          ),
        ],
      ));
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ));
    } else if (widget.source == SourceImage.SpecifyURL) {
      widgets.add(TextFormField(
        initialValue: imageURL,
        style: TextStyle(
            color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
        readOnly: !GlobalData.memberIsOwner(),
        onChanged: _onChanged,
//        controller: _urlController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
              color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
              color: RgbHelper.color(
                  rgbo: GlobalData.app().formFieldFocusColor))),
          icon: Icon(Icons.link, color: RgbHelper.color(
              rgbo: GlobalData.app().formFieldHeaderColor)),
          labelText: 'URL',
        ),
        keyboardType: TextInputType.text,
        autovalidate: true,
      ));
    } else {
      widgets.add(Text("The user's profile photo"));
    }

    return Builder(
      builder: (context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }

    @override
    void dispose() {
      _urlController.dispose();
      super.dispose();
    }
}
