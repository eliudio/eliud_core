import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/has_appbar.dart';
import 'package:eliud_core/style/shared/has_list_tile.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../eliud_style.dart';
import 'eliud_menu_impl.dart';

class EliudListTileImpl implements HasListTile {
  final EliudStyle _eliudStyle;

  EliudListTileImpl(this._eliudStyle);

  @override
  Widget getListTile(BuildContext context, {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return ListTile(
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }
}
