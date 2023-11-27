import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/model/member_model.dart';

import '../access/access_bloc.dart';
import '../eliud.dart';

class PackageConditionDetails {
  final String conditionName;
  final String packageName;
  final bool value;

  PackageConditionDetails(
      {required this.packageName,
      required this.conditionName,
      required this.value});
}

abstract class CoreFunctions {}

abstract class Package extends Equatable {
  final String packageName;

  Package(this.packageName);
  /*
   * Initialise your plugin. You can use isWeb() or isMobile() to determine the context of your plugin.
   * Initialise your repositories and any other platform specifics
   */
  void init();

  /*
   * Register depending packages
   */
  void registerDependencies(Eliud eliud);

  Future<List<PackageConditionDetails>>? getAndSubscribe(
      AccessBloc accessBloc,
      AppModel app,
      MemberModel? member,
      bool isOwner,
      bool? isBlocked,
      PrivilegeLevel? privilegeLevel);

  /*
   * Plugins can create a bloc on the highest level by implementing this method.
   * Example implementation: return BlocProvider<CartBloc>(create: (context) => CartBloc(appId, accessBloc));
   */
  BlocProvider? createPackageAppBloc(String appId, AccessBloc accessBloc) =>
      null;

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
/*
  Future<bool?> isConditionOk(AccessBloc accessBloc, String pluginCondition, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel);
*/

  List<String>? retrieveAllPackageConditions();

  /*
   * Retrieve the list of MemberCollections. This is required for GDPR functionality, i.e. the ability to retrieve and delete member data
   */
  List<MemberCollectionInfo>? getMemberCollectionInfo();
}
