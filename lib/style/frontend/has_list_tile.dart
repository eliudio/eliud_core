import 'package:flutter/material.dart';

abstract class HasListTile {
  Widget getListTile(BuildContext context,
      {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine});
}
