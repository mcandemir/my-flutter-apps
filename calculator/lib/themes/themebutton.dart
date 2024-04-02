import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.changeTheme,
  });

  final void Function(
    String,
    String,
  ) changeTheme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          showMenu(
              context: context,
              position: RelativeRect.fromRect(
                const Rect.fromLTWH(0, 0, 100, 100),
                const Rect.fromLTWH(0, 0, 100, 100),
              ),
              items: [
                PopupMenuItem(
                  child: const Text('Deep Purple'),
                  onTap: () =>
                      {changeTheme('deepPurpleTheme', 'deepPurpleThemeDark')},
                ),
                PopupMenuItem(
                  child: const Text('Purple'),
                  onTap: () => {changeTheme('purpleTheme', 'purpleThemeDark')},
                ),
                PopupMenuItem(
                  child: const Text('Red'),
                  onTap: () => {changeTheme('redTheme', 'redThemeDark')},
                ),
                PopupMenuItem(
                  child: const Text('Orange'),
                  onTap: () => {changeTheme('orangeTheme', 'orangeThemeDark')},
                ),
                PopupMenuItem(
                  child: const Text('Cyan'),
                  onTap: () => {changeTheme('cyanTheme', 'cyanThemeDark')},
                ),
                PopupMenuItem(
                  child: const Text('Yellow'),
                  onTap: () => {changeTheme('yellowTheme', 'yellowThemeDark')},
                ),
              ]);
          // showBottomSheet(
          //     context: context, builder: (ctx) => const ThemesMenu());
        },
        icon: const Icon(Icons.palette),
        label: const Text('Themes'));
  }
}
