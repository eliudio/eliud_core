import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/extensions/member_profile_component.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:eliud_core/model/component_registry.dart';

import 'core/access/bloc/access_event.dart';
import 'package/package.dart';
import 'package/package_with_subscription.dart';

class CorePackage extends PackageWithSubscription {
  static final String MUST_BE_LOGGED_ON = 'MustBeLoggedOn';

  MemberModel stateMemberModel;

  void _setState(MemberModel currentMember) {
    if (stateMemberModel != currentMember) {
      stateMemberModel = currentMember;
      accessBloc.add(MemberUpdated(stateMemberModel));
    }
  }

  @override
  // The member subscription is an extra luxury to make sure member data is up to date
  // But, I'm actually unsure this subscription should happen.
  void resubscribe(AppModel app, MemberModel currentMember) {
    var appId = app.documentID;
    if (currentMember != null) {
      subscription = memberRepository(appId: appId).listen((list) {
        if (list.isNotEmpty) {
          _setState(list.first);
        } else {
          _setState(null);
        }
      }, eliudQuery: getMemberQuery(
          appId, currentMember.documentID));
    } else {
      _setState(null);
    }
  }

  void unsubscribe() {
    super.unsubscribe();
    _setState(null);
  }

  static EliudQuery getMemberQuery(String appId, String memberId) {
    return EliudQuery(
        theConditions: [EliudQueryCondition(
            DocumentIdField(),
            isEqualTo: memberId
        )]
    );
  }

  @override
  void init() {
  }

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner, bool isBlocked, PrivilegeLevel privilegeLevel) async {
    if (packageCondition == MUST_BE_LOGGED_ON) {
      return (member != null);
    }
    return false;
  }

  @override
  List<String> retrieveAllPackageConditions() {
    return [
      MUST_BE_LOGGED_ON
    ];
  }
}

abstract class Eliud {
  void register(Package package) {
    GlobalData.registerPackage(package);
  }

  void initRegistryAndPackages() {
    try {


      AbstractPlatform.platform = getPlatform();
      AbstractPlatform.platform.init();
      ComponentRegistry().init();

      // Initialise custom extensions:
      Registry.registry().register(
          componentName: MemberProfileConstructorDefault
              .MEMBER_PROFILE_COMPONENT_IDENTIFIER,
          componentConstructor: MemberProfileConstructorDefault());

      GlobalData.registeredPackages.add(CorePackage());
      var plugins = GlobalData.registeredPackages;
      for (var i = 0; i < plugins.length; i++) {
        var plugin = plugins[i];
        plugin.init();
      }

    } catch (error) {
      print (error);
    }
  }

  // Run the application wihtout playstore
  // appId is the application you want to start and therefore not be null.
  // asPlayStore flag allows to run the playstore app where people can use it to switch to other apps, create apps, ....
  // Ones in the other app, then can switch back to thePlayStoreApp
  // ThePlayStoreApp is the application which serves as the playstore and which you want to run
  // An icon will be available in the appBar to go to theMinkeyApp
  void run(String appId, bool asPlaystore) async {
    runApp(Registry.registry().application(id: appId, asPlaystore: asPlaystore));
  }

  AbstractPlatform getPlatform();
}
