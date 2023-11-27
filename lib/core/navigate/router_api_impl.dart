import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/apis/routerapi/router_api.dart';
import 'package:flutter/src/widgets/framework.dart';

class RouterApiImpl extends RouterApi {
  @override
  Future<void> navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters}) {
    return Router.navigateTo(context, action, parameters: parameters);
  }
}
