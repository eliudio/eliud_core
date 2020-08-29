/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class MemberEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMember extends MemberEvent {
  final String id;

  FetchMember({ this.id });
}

