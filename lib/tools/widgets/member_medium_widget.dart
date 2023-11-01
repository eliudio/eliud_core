import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

class MemberMediumWidget extends StatefulWidget {
  final MemberMediumModel memberMediumModel;
  final AppModel app;
  MemberMediumWidget({Key? key, required this.app, required this.memberMediumModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MemberMediumWidgetState();
  }
}

class _MemberMediumWidgetState extends State<MemberMediumWidget> {
  @override
  Widget build(BuildContext context) {
    var image = widget.memberMediumModel;
    return topicContainer(widget.app, context,
        title: 'Image',
        collapsible: true,
        collapsed: true,
        children: [
          topicContainer(widget.app, context,
              title: 'Image',
              collapsible: true,
              collapsed: true,
              children: [
                Image.network(
                  image.url!,
                  //            height: height,
                )
              ]),
          topicContainer(widget.app, context,
              title: 'General',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: Icon(Icons.vpn_key),
                    title: text(widget.app, context, image.documentID)),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'author ID'),
                    title: text(widget.app, context, image.authorId!)),
              ]),
          topicContainer(widget.app, context,
              title: 'Size',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'thumbnail height'),
                    title: text(
                        widget.app,
                        context,
                        image.thumbnailHeight != null
                            ? image.thumbnailHeight.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'thumbnail width'),
                    title: text(
                        widget.app,
                        context,
                        image.thumbnailWidth != null
                            ? image.thumbnailWidth.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'height'),
                    title: text(
                        widget.app,
                        context,
                        image.mediumHeight != null
                            ? image.mediumHeight.toString()
                            : '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'width'),
                    title: text(
                        widget.app,
                        context,
                        image.mediumWidth != null
                            ? image.mediumWidth.toString()
                            : '')),
              ]),
          topicContainer(widget.app, context,
              title: 'Links',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'url'),
                    title: text(widget.app, context, image.url ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'url thumbnail'),
                    title: text(widget.app, context, image.urlThumbnail ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'ref'),
                    title: text(widget.app, context, image.ref ?? '')),
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'ref thumbail'),
                    title: text(widget.app, context, image.refThumbnail ?? '')),
              ]),
          topicContainer(widget.app, context,
              title: 'Conditions',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context, widget.app,
                    leading: text(widget.app, context, 'Accessible by'),
                    title: text(widget.app, context, accessibleByGroupToString(image.accessibleByGroup))),
                if (image.accessibleByGroup == MemberMediumAccessibleByGroup.SpecificMembers)
                  getListTile(context, widget.app,
                      leading: text(widget.app, context, 'Specific members:'),
                      title: text(widget.app, context, specificMembersToString(image.accessibleByMembers))),
              ]),
        ]);
  }

  String specificMembersToString(List<String>? accessibleByMembers) {
    if (accessibleByMembers == null) return 'Nobody';
    return accessibleByMembers.join(', ');
  }

  String accessibleByGroupToString(MemberMediumAccessibleByGroup? mediumAccessibleByGroup) {
    switch (mediumAccessibleByGroup) {
      case MemberMediumAccessibleByGroup.Public: return 'Public';
      case MemberMediumAccessibleByGroup.Followers: return 'Followers';
      case MemberMediumAccessibleByGroup.Me: return 'Me';
      case MemberMediumAccessibleByGroup.SpecificMembers: return 'Specific members';
    }
    return '?';
  }
}
