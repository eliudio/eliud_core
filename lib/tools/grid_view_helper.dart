import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewHelper {
  static Widget container(BuildContext context, List<Widget> components, GridViewModel? gridView) {
    if (gridView == null) {
      // gridview has been specified without selecting a gridview... only returning the first component
      return components[0];
    } else {
      if (gridView.type == GridViewGridType.Count) {
        return GridView.count(crossAxisCount: gridView.crossAxisCount!,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            childAspectRatio: gridView.childAspectRatio!,
            padding: EdgeInsets.all(gridView.padding!),
            scrollDirection: gridView.scrollDirection ==
                GridViewScrollDirection.Vertical ? Axis.vertical : Axis
                .horizontal,
            mainAxisSpacing: gridView.mainAxisSpacing!,
            crossAxisSpacing: gridView.crossAxisSpacing!,
            children: components as List<Widget>);
      } else {
        double? maxCrossAxisExtent;
        if (gridView.maxCrossAxisExtentType ==
            MaxCrossAxisExtentType.Absolute) {
          maxCrossAxisExtent = gridView.absoluteMaxCrossAxisExtent;
        }
        else {
          if (gridView.scrollDirection ==
              GridViewScrollDirection.Vertical) {
            maxCrossAxisExtent = fullScreenHeight(context) *
                gridView.relativeMaxCrossAxisExtent!;
          } else {
            maxCrossAxisExtent = fullScreenWidth(context) *
                gridView.relativeMaxCrossAxisExtent!;
          }
        }
        return GridView.extent(maxCrossAxisExtent: maxCrossAxisExtent!,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            childAspectRatio: gridView.childAspectRatio!,
            padding: EdgeInsets.all(gridView.padding!),
            scrollDirection: gridView.scrollDirection ==
                GridViewScrollDirection.Vertical ? Axis.vertical : Axis
                .horizontal,
            mainAxisSpacing: gridView.mainAxisSpacing!,
            crossAxisSpacing: gridView.crossAxisSpacing!,
            children: components as List<Widget>);
      }
    }
  }
}
