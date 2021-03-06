import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

class MemberCollectionInfo {
  // name of the collection, e.g. "Post"
  final String name;

  // name of the field which is the member, e.g. "memberId"
  final String memberIdentifier;

  MemberCollectionInfo(this.name, this.memberIdentifier);
}

abstract class Package {
  /*
   * Initialise your plugin. You can use isWeb() or isMobile() to determine the context of your plugin.
   * Initialise your repositories and any other platform specifics
   */
  void init();

  /*
   * Plugins can create a bloc on the highest level by implementing this method.
   * Example implementation: return BlocProvider<CartBloc>(create: (context) => CartBloc(navigatorBloc, accessBloc));
   *
   * It is common for a package to subscribe to AccessBloc events and states.
   * This is best done from within the method createMainBloc.
   *
   * To do so, implement
   *
   *   void mapAccessEvent(AccessEvent event, AccessState state) {}
   *
   * and / or
   *
   *   void mapAccessStateBefore(AccessEvent event, AccessState state) {}
   *   void mapAccessStateAfter(AccessEvent event, AccessState state) {}
   *
   * In this method we also can extend the AccessBloc functionality, i.e. add an event mapper
   * accessBloc.addMapper();
   */
  BlocProvider  createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc);

  /*
   * To determine if a page is accessible, the page condition can be indicated as a "PluginDecides" condition.
   * The plugin should respond:
   *
   * false: not applicable to this plugin
   * true: accessible
   * false: not accessible
   *
   * For example: for a shop the cart page is accessible only if items are in the basket. Only the Shop plugin should implement this
   * and return true / false depending on items in the basket.
   */
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel);

  List<String> retrieveAllPackageConditions();

  /*
   * Retrieve the list of MemberCollections. This is required for GDPR functionality, i.e. the ability to retrieve and delete member data
   */
  List<MemberCollectionInfo> getMemberCollectionInfo();
}
