import 'dart:async';

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliud_router;

import 'package.dart';

// Todo: clearly we can introduce some caching, as we are listening as well as querying the same data. So, instead: keep a cache and update the cache adnd use it from within the isConditionOk
abstract class PackageWithSubscription extends Package {
  AccessBloc accessBloc;
  StreamSubscription subscription;

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc, AccessBloc accessBloc) {
    // store the accessBloc
    this.accessBloc = accessBloc;

    // register an extra access bloc event mapper, pointing our mapAccessEvent method
    //  accessBloc.addMapper(mapAccessEvent);
    accessBloc.addStateChangeListener(mapAccessState);

    return null;
  }

  void mapAccessState(AccessEvent event, AccessState state) {
    // state is the state after it was handled by AccessBloc
    if (state is AppLoaded) {
      if (event is InitApp) {
        _listenForChanges(state.app, state.getMember());
      } else if (event is SwitchAppEvent) {
        _listenForChanges(state.app, state.getMember());
      } else if (event is LogoutEvent) {
        subscription?.cancel();
      } else if (event is LoginEvent) {
        _listenForChanges(state.app, state.getMember());
      }
    }
  }

  void _listenForChanges(AppModel app, MemberModel currentMember) {
    if (currentMember == null) return;
    String appId = app.documentID;
    subscription?.cancel();
    resubscribe(app, currentMember);
  }

  void resubscribe(AppModel app, MemberModel currentMember);
}
