import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talkdimsum/ui/cupertino/app.dart' as cupertino;

enum MenuSelection {
  about,
  showMessage,
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MyMenuBarApp()),
    );
  }
}

class MyMenuBarApp extends StatefulWidget {
  const MyMenuBarApp({Key? key}) : super(key: key);

  @override
  State<MyMenuBarApp> createState() => _MyMenuBarAppState();
}

class _MyMenuBarAppState extends State<MyMenuBarApp> {
  String _message = 'Hello';
  bool _showMessage = false;

  void _handleMenuSelection(MenuSelection value) {
    switch (value) {
      case MenuSelection.about:
        showAboutDialog(
          context: context,
          applicationName: 'Talk Dim Sum',
          applicationVersion: '1.0.0',
        );
        break;
      case MenuSelection.showMessage:
        setState(() {
          _showMessage = !_showMessage;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: <MenuItem>[
        PlatformMenu(label: 'Flutter API Sample', menus: <MenuItem>[
          PlatformMenuItemGroup(
            members: <MenuItem>[
              PlatformMenuItem(
                label: 'About',
                onSelected: () {
                  _handleMenuSelection(MenuSelection.about);
                },
              )
            ],
          ),
          if (PlatformProvidedMenuItem.hasMenu(
              PlatformProvidedMenuItemType.quit))
            const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.quit),
        ]),
        PlatformMenu(
          label: 'Flutter API Sample',
          menus: <MenuItem>[
            PlatformMenuItemGroup(
              members: <MenuItem>[
                PlatformMenuItem(
                  onSelected: () {
                    _handleMenuSelection(MenuSelection.showMessage);
                  },
                  shortcut: const CharacterActivator('m'),
                  label: _showMessage ? 'Hide Message' : 'Show Message',
                ),
                PlatformMenu(
                  label: 'Messages',
                  menus: <MenuItem>[
                    PlatformMenuItem(
                      label: 'I am not throwing away my shot.',
                      shortcut: const SingleActivator(LogicalKeyboardKey.digit1,
                          meta: true),
                      onSelected: () {
                        setState(() {
                          _message = 'I am not throwing away my shot.';
                        });
                      },
                    ),
                    PlatformMenuItem(
                      label:
                          "There's a million things I haven't done, but just you wait.",
                      shortcut: const SingleActivator(LogicalKeyboardKey.digit2,
                          meta: true),
                      onSelected: () {
                        setState(() {
                          _message =
                              "There's a million things I haven't done, but just you wait.";
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
      body: cupertino.App(),
    );
  }
}
