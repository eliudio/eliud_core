import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:flutter/cupertino.dart';

abstract class FrontEndStyle
    implements
        HasTexFormField,
        HasDivider,
        HasButton,
        HasText,
        HasStyle,
        HasIcon,
        HasTable,
        HasAppBar,
        HasMenu,
        HasBottomNavigationBar,
        HasPageBody {
  Widget container(BuildContext context, {Widget child});
}
