import 'package:flutter/material.dart';

abstract class HasButton {
  // Most common button(s), e.g. to confirm a form
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});
    // Search for OutlineButton and RaisedButton

  // Simpler button, e.g. the 'like' or 'reply' button below a post in a feed
  Widget simpleButton(BuildContext context,
      {VoidCallback? onPressed, required String label});
    // Search for FlatButton and TextButton, take all inputs for the input of this method and copy it's implementation

  // Button in a dialog, e.g. to close the dialog
  Widget dialogButton(BuildContext context,
      {VoidCallback? onPressed, required String label});
  List<Widget> dialogButtons(BuildContext context, {required List<String> labels,
    required List<VoidCallback?> functions});

  // Button with icon only
  Widget iconButton(BuildContext context,
      {VoidCallback? onPressed, required Icon icon});
    // Search for IconButton, take all inputs for the input of this method and copy it's implementation

}
