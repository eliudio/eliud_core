import 'dart:async';

import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core/access/state/logged_in.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/apis/coreapi/core_api.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreApiImpl extends CoreApi {
  @override
  bool memberIsOwner(BuildContext context, String appId) {
    var state = AccessBloc.getState(context);
    return state.memberIsOwner(appId);
  }

  @override
  MemberModel? getMember(
    BuildContext context,
  ) {
    var state = AccessBloc.getState(context);
    if (state is AccessDetermined) {
      return state.getMember();
    } else {
      return null;
    }
  }

  @override
  Widget buildWhenAccessDetermined(AppModel app, BuildIt buildIt) {
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, state) {
      if (state is AccessDetermined) {
        return buildIt(context);
      } else {
        return progressIndicator(app, context);
      }
    });
  }

  @override
  Future<bool> hasAccess(BuildContext context, ActionModel action) async {
    var accessState = AccessBloc.getState(context);
    if (accessState is AccessDetermined) {
      return accessState.actionHasAccess(action);
    }
    return true;
  }

  @override
  bool isLoggedIn(BuildContext context) {
    var state = AccessBloc.getState(context);
    return (state is LoggedIn);
  }

  @override
  String? currentMemberId(BuildContext context) {
    var state = AccessBloc.getState(context);
    if (state is LoggedIn) {
      return state.member.documentID;
    } else {
      return null;
    }
  }

  MemberModel? currentMember(BuildContext context) {
    var state = AccessBloc.getState(context);
    if (state is LoggedIn) {
      return state.member;
    } else {
      return null;
    }
  }
}
