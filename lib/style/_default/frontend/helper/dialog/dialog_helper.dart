import 'dart:math';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../../../tools/etc.dart';

enum DialogButtonPosition { BottomRight, TopRight }

class DialogStatefulWidgetHelper {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 1;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 1;

  static Future<void> openIt(BuildContext context, String name, Widget dialog,
      {double? heightValue, double? widthValue}) async {
    var _width =
        widthValue == null ? width(context) : min(width(context), widthValue);
    var _height = heightValue == null
        ? height(context)
        : min(height(context), heightValue);

    await showGeneralDialog(
        routeSettings: RouteSettings(name: name),
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 500),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          // using a PointerInterceptor in case we open a dialog over a web iframe, to make sure the focus is on the dialog
          return PointerInterceptor(child: SafeArea(
              child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: _width, height: _height, child: dialog)))));
        });
  }
}

// We use this helper allowing to maintain, reuse and change common dialog behavior
class DialogStateHelper {
  DialogStateHelper();

  Widget build(AppModel app,
      BuildContext context, {
    String? title,
    Key? key,
    required Widget contents,
    List<Widget>? buttons,
    double? width,
    required DialogButtonPosition dialogButtonPosition,
    Widget? separator,
    bool? includeHeading,
    RgbModel? dialogBackgroundColor,
    RgbModel? dialogSeperatorColor,
  }) {
    return Dialog(
        key: key,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: dialogBackgroundColor != null ? RgbHelper.color(rgbo: dialogBackgroundColor) : Colors.grey[200],
        child: Form(
            //key: _formKey,
            child: _titleAndFieldsAndContent(app, context,
                title: title,
                contents: contents,
                buttons: buttons,
                width: width,
                dialogButtonPosition: dialogButtonPosition,
                separator: separator,
                includeHeading: includeHeading,
                seperatorColor: dialogSeperatorColor
            )));
  }

  Widget _getRowWithButtons(List<Widget>? buttons, {Widget? title}) {
    var widgets = <Widget>[];
    if (title != null) {
      widgets.add(title);
    }
    widgets.add(Spacer());
    if (buttons != null) {
      widgets.addAll(buttons);
    }
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  Widget seperatorWidget(Widget? separator, RgbModel? seperatorColor) {
    var seperatorWidget;
    if (separator == null) {
      seperatorWidget = Divider(
        height: 15,
        thickness: 5,
        color: seperatorColor != null ? RgbHelper.color(
              rgbo: seperatorColor) : Colors.red,
      );
    } else {
      seperatorWidget = separator;
    }
    return seperatorWidget;
  }

  Widget _titleAndFieldsAndContent(AppModel app, BuildContext context,
      {String? title,
      required Widget contents,
      List<Widget>? buttons,
      double? width,
      DialogButtonPosition? dialogButtonPosition,
      Widget? separator,
      bool? includeHeading,
      RgbModel? seperatorColor,
      }) {
    var items = <Widget>[];

    var titleContainer;
    if ((includeHeading != null) && (includeHeading) && (buttons != null)) {
      // Title
      var _title = StyleRegistry.registry()
          .styleWithApp(app)
          .frontEndStyle()
          .textStyle()
          .h4(app, context, title ?? '');

      var titleWidget;
      if ((dialogButtonPosition != null) &&
          (dialogButtonPosition == DialogButtonPosition.TopRight)) {
        titleWidget = _getRowWithButtons(buttons, title: _title);
      } else {
        titleWidget = Center(child: _title);
      }
      titleContainer = Container(
          child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [titleWidget, seperatorWidget(separator, seperatorColor)],
      ));
    }

    // Middle
    var middle = Flexible(
        child: ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[contents]));

    if (titleContainer != null) {
      // Footer
      var footerContainer;
      if (!((dialogButtonPosition != null) &&
          (dialogButtonPosition == DialogButtonPosition.TopRight))) {
        footerContainer = Container(
            child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [seperatorWidget(separator, seperatorColor), _getRowWithButtons(buttons)],
        ));
        items = [titleContainer, middle, footerContainer];
      } else {
        items = [titleContainer, middle];
      }
    } else {
      // Footer
      var footerContainer;
      if (!((dialogButtonPosition != null) &&
          (dialogButtonPosition == DialogButtonPosition.TopRight))) {
        footerContainer = Container(
            child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [_getRowWithButtons(buttons)]));
        items = [middle, footerContainer];
      } else {
        items = [middle];
      }
    }

    return Container(
        width: width,
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: items));
  }

  /* Helper method to create a list tile */
  Widget getListTile(
      {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return ListTile(
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }

  /* Helper method to format the fields */
  Widget fieldsWidget(AppModel app, BuildContext context, List<Widget> widgets,
      {double? height, double? width}) {
    return StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .containerStyle()
        .simpleTopicContainer(app, context,
            children: widgets, height: height, width: width);
/*
    return Container(
        height: (height != null)
            ? height
            : DialogStatefulWidgetHelper.height(context) -
                150 */
/* minus the size of the button, title and divider */ /*
,
        width:
            (width != null) ? width : DialogStatefulWidgetHelper.width(context),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: widgets));
*/
  }

  /* Helper method to retrieve the button */
  List<Widget> getCloseButton(AppModel app,
      BuildContext context, {
    required VoidCallback onPressed,
    String? buttonLabel,
  }) {
    return <Widget>[
      StyleRegistry.registry()
          .styleWithApp(app)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(app, context,
              label: buttonLabel ?? 'Close', onPressed: onPressed),
    ];
  }

  List<Widget> getDefaultCloseButton(AppModel app, BuildContext context) {
    return getCloseButton(app, context,
        buttonLabel: 'Close', onPressed: () => Navigator.pop(context));
  }

  List<Widget> getAckNackButtons(AppModel app, BuildContext context,
      {required VoidCallback ackFunction,
      required VoidCallback nackFunction,
      String? ackButtonLabel,
      String? nackButtonLabel}) {
    return <Widget>[
      StyleRegistry.registry()
          .styleWithApp(app)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(app,
            context,
            label: nackButtonLabel ?? 'Cancel',
            onPressed: nackFunction,
          ),
      StyleRegistry.registry()
          .styleWithApp(app)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(app, context,
              label: ackButtonLabel ?? 'Continue', onPressed: ackFunction),
    ];
  }

  List<Widget> getButtons(AppModel app, BuildContext context, List<String> buttonLabels,
      List<VoidCallback> functions) {
    if (buttonLabels.length != functions.length) {
      throw Exception(
          'Amount of labels of buttons does not correspond functions');
    }
    var buttons = <Widget>[];
    for (var i = 0; i < buttonLabels.length; i++) {
      var label = buttonLabels[i];
      var function = functions[i];
      buttons.add(StyleRegistry.registry()
          .styleWithApp(app)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(app, context, label: label, onPressed: function));
    }
    return buttons;
  }
}
