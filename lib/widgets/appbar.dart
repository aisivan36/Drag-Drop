import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xfff64209)),
      title: Text(
        'Drag Food',
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 36,
              color: const Color(0xfff64209),
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: const Color(0xfff7f7f7),
      elevation: 0,
    );
  }

  @override

  /// kToolbarHeight is default value of AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
