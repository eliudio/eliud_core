import 'package:flutter/material.dart';

Future<IconData?> showIconPicker(
    {required BuildContext context, IconData? defalutIcon}) async {
// these are the selectable icons
// they will be displayed in a grid view
// you can specify the icons you need
  final List<IconData> allIcons = [
    Icons.umbrella_sharp,
    Icons.favorite,
    Icons.headphones,
    Icons.home,
    Icons.car_repair,
    Icons.settings,
    Icons.flight,
    Icons.ac_unit,
    Icons.run_circle,
    Icons.book,
    Icons.sports_rugby_rounded,
    Icons.alarm,
    Icons.call,
    Icons.snowing,
    Icons.hearing,
    Icons.music_note,
    Icons.note,
    Icons.edit,
    Icons.sunny,
    Icons.radar,

// add more icons here if you want
  ];

// selected icon
// the selected icon is highlighed
// so it looks different from the others
  IconData? selectedIcon = defalutIcon;

  await showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('Pick an Icon'),
            content: Container(
              width: 320,
              height: 400,
              alignment: Alignment.center,
// This grid view displays all selectable icons
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 60,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: allIcons.length,
                  itemBuilder: (_, index) => Container(
                        key: ValueKey(allIcons[index].codePoint),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: IconButton(
// give the selected icon a different color
                            color: selectedIcon == allIcons[index]
                                ? Colors.blue
                                : Colors.green,
                            iconSize: 30,
                            icon: Icon(
                              allIcons[index],
                            ),
                            onPressed: () {
                              selectedIcon = allIcons[index];
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'))
            ],
          ));

  return selectedIcon;
}
