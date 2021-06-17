import 'package:eliud_core/style/shared/has_container.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudContainerImpl implements HasContainer {
  final EliudStyle _eliudStyle;

  EliudContainerImpl(this._eliudStyle);

  @override
  Widget actionContainer(BuildContext context, {required Widget child}) {
    return Container(
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
              ),
            ],
            borderRadius: BorderRadius.all(
              const Radius.circular(10.0),
            )),
        child: child);
  }

  @override
  Widget topicContainer(BuildContext context, {required List<Widget> children, DecorationImage? image}) {
    return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: image,
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                )),
            child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ))));
  }
}
