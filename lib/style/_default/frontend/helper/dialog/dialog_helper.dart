import 'dart:math';
import 'dart:ui';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogButtonPosition { BottomRight, TopRight }

class DialogStatefulWidgetHelper {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 1;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 1;

  static void openIt(BuildContext context, Widget dialog,
      {double? heightValue, double? widthValue}) {
    var _width =
        widthValue == null ? width(context) : min(width(context), widthValue);
    var _height = heightValue == null
        ? height(context)
        : min(height(context), heightValue);

    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 1000),
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
          return SafeArea(
              child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: _width, height: _height, child: dialog))));
        });
  }
}

// We use this helper allowing to maintain, reuse and change common dialog behavior
class DialogStateHelper {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DialogStateHelper();

  Widget build(
    BuildContext context, {
    required String title,
    Key? key,
    required Widget contents,
    required List<Widget> buttons,
    double? width,
    required DialogButtonPosition dialogButtonPosition,
    Widget? separator,
    bool? includeHeading,
  }) {
    return Dialog(
        key: key,
        insetPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
        child: Form(
            //key: _formKey,
            child: _titleAndFieldsAndContent(context,
                title: title,
                contents: contents,
                buttons: buttons,
                width: width,
                dialogButtonPosition: dialogButtonPosition,
                separator: separator,
                includeHeading: includeHeading)));
  }

  Widget _getRowWithButtons(List<Widget> buttons, {Widget? title}) {
    var widgets = <Widget>[];
    if (title != null) {
      widgets.add(title);
    }
    widgets.add(Spacer());
    widgets.addAll(buttons);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  Widget seperatorWidget(Widget? separator) {
    var seperatorWidget;
    if (separator == null) {
      seperatorWidget = Divider(
        height: 15,
        thickness: 5,
        color: Colors.red,
      );
    } else {
      seperatorWidget = separator;
    }
    return seperatorWidget;
  }

  Widget _titleAndFieldsAndContent(BuildContext context,
      {required String title,
      required Widget contents,
      required List<Widget> buttons,
      double? width,
      DialogButtonPosition? dialogButtonPosition,
      Widget? separator,
      bool? includeHeading}) {
    var items = <Widget>[];

    var titleContainer;
    if ((includeHeading == null) || (includeHeading)) {
      // Title
      var _title = StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .textStyle()
          .h4(context, title);

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
        children: [titleWidget, seperatorWidget(separator)],
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
          children: [seperatorWidget(separator), _getRowWithButtons(buttons)],
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
  Widget fieldsWidget(BuildContext context, List<Widget> widgets,
      {double? height, double? width}) {
    return StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .containerStyle()
        .simpleTopicContainer(context,
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
  List<Widget> getCloseButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String? buttonLabel,
  }) {
    return <Widget>[
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(context,
              label: buttonLabel ?? 'Close', onPressed: onPressed),
    ];
  }

  List<Widget> getDefaultCloseButton(BuildContext context) {
    return getCloseButton(context,
        buttonLabel: 'Close', onPressed: () => Navigator.pop(context));
  }

  List<Widget> getAckNackButtons(BuildContext context,
      {required VoidCallback ackFunction,
      required VoidCallback nackFunction,
      String? ackButtonLabel,
      String? nackButtonLabel}) {
    return <Widget>[
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(
            context,
            label: nackButtonLabel ?? 'Cancel',
            onPressed: nackFunction,
          ),
      StyleRegistry.registry()
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(context,
              label: ackButtonLabel ?? 'Continue', onPressed: ackFunction),
    ];
  }

  List<Widget> getButtons(BuildContext context, List<String> buttonLabels,
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
          .styleWithContext(context)
          .frontEndStyle()
          .buttonStyle()
          .dialogButton(context, label: label, onPressed: function));
    }
    return buttons;
  }
}
