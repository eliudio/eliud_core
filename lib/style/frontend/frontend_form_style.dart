import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:flutter/cupertino.dart';

abstract class FrontEndFormStyle
    implements
        HasTexFormField,
        HasDivider,
        HasButton,
        HasText,
        HasStyle,
        HasIcon,
        HasTable,
        HasAppBar,
        HasBottomNavigationBar,
        HasPageBody {
  Widget container(BuildContext context, {Widget child});
}
