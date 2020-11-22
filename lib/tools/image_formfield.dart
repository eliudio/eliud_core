import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:eliud_core/model/image_model.dart';

typedef ChangeImageField = Function(String url);

const String DEFAULT_IMAGE =
    'https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

class ImageFieldHelper {
  static String localFileName(String imageURL) {
    if (imageURL.startsWith('local:')) return imageURL.substring(6);
    return null;
  }
}

class ImageField extends StatefulWidget {
  final SourceImage source;
  final String imageURL;
  final ChangeImageField trigger;

  ImageField(this.source, this.imageURL, this.trigger);

  @override
  State<ImageField> createState() {
    return ImageFieldState(imageURL: imageURL);
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
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          imageURL = 'local:' + image.path;
          widget.trigger(imageURL);
        });
      }
    }

    Future<void> crop() async {
      var image = await ImageCropper.cropImage(
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
          imageURL = 'local:' + image.path;
          widget.trigger(imageURL);
        });
      }
    }

    var width = fullScreenWidth(context);
    var height = fullScreenHeight(context);

    var fullWidth = (width < height ? width : height) - 56;

    var widgets = <Widget>[];
    if (widget.source == SourceImage.Upload) {
      var localFileName = ImageFieldHelper.localFileName(widget.imageURL);
      var buttons = <Widget>[];
      if (accessState.memberIsOwner(appState)) {
        buttons.add(IconButton(
            icon: Icon(Icons.add_a_photo),
            tooltip: 'Select a photo',
            onPressed: () {
              getImage();
            }));
      }
      if (isLocal()) {
        // Allow a new image to be cropped. This hasn't been uploaded yet
        buttons.add(IconButton(
            icon: Icon(Icons.crop),
            tooltip: 'Crop',
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
              child: SizedBox(
                width: fullWidth,
                //height: fullWidth,
                child: (localFileName != null)
                    ? Image.file(
                        File(localFileName),
                        fit: BoxFit.fill,
                      )]
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
        style: appState is AppLoaded ? TextStyle(
            color: RgbHelper.color(rgbo: appState.app.formFieldTextColor)) : null,
        readOnly: !accessState.memberIsOwner(appState),
        onChanged: _onChanged,
//        controller: _urlController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
              color: appState is AppLoaded ? RgbHelper.color(rgbo: appState.app.formFieldTextColor) : null)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
              color: appState is AppLoaded ? RgbHelper.color(
                  rgbo: appState.app.formFieldFocusColor): null)),
          icon: Icon(Icons.link, color: appState is AppLoaded ? RgbHelper.color(
              rgbo: appState.app.formFieldHeaderColor): null),
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
