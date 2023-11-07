// FAB = Floating Action Button
// Your component should implement this interface. If that happens and you've put that component onto a page, the floating action button will appear on the page
import 'package:flutter/cupertino.dart';

abstract class HasFab {
  Widget? fab(BuildContext context);
}
