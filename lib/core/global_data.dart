import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'access/bloc/access_details.dart';
import 'access/bloc/access_state.dart';

/*
 * This class is to no have to create a bloc every time this data is required. It is
 * supposed to be only set by AccessBloc, and read by very other class.
 */
class GlobalData {
  static AccessState _state = UndeterminedAccessState();

  static AccessState state() {
    return _state;
  }

  static AppModel app() {
    var myState = _state;
    if (myState is AccessStateWithDetails) {
      return myState.app;
    } else {
      return null;
    }
  }

  static MemberModel member() {
    var myState = _state;
    if (myState is LoggedIn) {
      return myState.member;
    } else {
      return null;
    }
  }

  static AccessDetails details() {
    var myState = _state;
    if (myState is AccessStateWithDetails) {
      return myState.details;
    } else {
      return null;
    }
  }

  static FirebaseUser usr() {
    var myState = _state;
    if (myState is LoggedIn) {
      return myState.usr;
    } else {
      return null;
    }
  }

  static bool forceAcceptMembership() {
    return (_state is LoggedInWithoutMembership);
  }

  static AccessState init(AccessState state) {
    _state = state;
    return _state;
  }

  static bool memberIsOwner() {
    return member() != null && member().documentID == app().ownerID;
  }

  static String memberProfilePhoto() {
    return member() == null ? null : member().photoURL;
  }

  static String homePage() {
    return app() == null ? null : app().entryPage.documentID;
  }

  static bool isLoggedOn() {
    return member() != null;
  }

  static bool accessToOtherApps() {
    return member() != null ? member().subscriptions.length > 1 : false;
  }

  static String memberID () {
    return member() == null ? '' : member().documentID;
  }

}
