import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:flutter/material.dart';

enum Layout { GridView, ListView, OnlyTheFirstComponent, Unknown }

abstract class HasPageBody {
  Widget pageBody(BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView});
}
