import 'package:flutter/material.dart';

abstract class HasTable {
  Widget table(BuildContext context, {required List<TableRow> children});
}

