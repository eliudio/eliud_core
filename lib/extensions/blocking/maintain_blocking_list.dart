import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core_main/model/app_model.dart';
import 'package:transparent_image/transparent_image.dart';

import 'bloc/maintain_blocking_list_bloc.dart';
import 'bloc/maintain_blocking_list_state.dart';
import 'bloc/maintain_blocking_list_event.dart';

class MaintainBlockingListWidget extends StatefulWidget {
  final AppModel app;

  MaintainBlockingListWidget({
    super.key,
    required this.app,
  });

  @override
  MaintainBlockingListWidgetState createState() {
    return MaintainBlockingListWidgetState();
  }
}

class MaintainBlockingListWidgetState
    extends State<MaintainBlockingListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<MaintainBlockingListBloc, MaintainBlockingListState>(
            builder: (context, state) {
          if (state is MaintainBlockingListLoading) {
            return StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .progressIndicator(widget.app, context);
          } else if (state is MaintainBlockingListLoaded) {
            final values = state.values;
            return theList(context, values, accessState);
          } else {
            return StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .progressIndicator(widget.app, context);
          }
        });
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  Widget theList(BuildContext context, List<BlockedMember> values,
      AccessState accessState) {
    return Container(
//      decoration: widget.listBackground == null ? StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().boxDecorator(widget.app, context, accessState.getMember()) : BoxDecorationHelper.boxDecoration(widget.app, accessState.getMember(), widget.listBackground),
        child: ListView.separated(
            separatorBuilder: (context, index) => StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .divider(widget.app, context),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];
              return BlockingListItem(
                app: widget.app,
                value: value,
                onDismissed: (direction) {
                  BlocProvider.of<MaintainBlockingListBloc>(context)
                      .add(DeleteMaintainBlockingList(value: value));
                },
                onTap: () async {
                  // ask to remove from blocked
                },
              );
            }));
  }
}

class BlockingListItem extends StatelessWidget {
  final AppModel app;
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final BlockedMember value;

  BlockingListItem({
    super.key,
    required this.app,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Widget photo;
    String name;
    if ((value.memberPublicInfoModel.photoURL == null)) {
      name = 'No name';
      photo = const Icon(Icons.person);
    } else {
      photo = FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: value.memberPublicInfoModel.photoURL!,
      );
      name = ((value.memberPublicInfoModel.name != null) &&
              (value.memberPublicInfoModel.name!.isNotEmpty))
          ? value.memberPublicInfoModel.name!
          : 'No name';
    }
    return Dismissible(
        key: Key('__Blocking_item_${value.blockingModel.documentID}'),
        onDismissed: onDismissed,
        child: ListTile(
            //leading: const Icon(Icons.chat_bubble_outline),
            leading: Container(
              height: 100,
              width: 100,
              child: photo,
            ),
            title: text(
              app,
              context,
              name,
            )));
  }
}
