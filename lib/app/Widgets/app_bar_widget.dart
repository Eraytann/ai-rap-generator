// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required bool isBackOpen,
    IconButton? leadingIcon,
    Color? backgroundColor,
    this.title,
    this.actions,
  })  : _isBackOpen = isBackOpen,
        _leadingIcon = leadingIcon,
        _backgroundColor = backgroundColor;

  final bool _isBackOpen;
  final IconButton? _leadingIcon;
  final Color? _backgroundColor;
  final Text? title;
  final Widget? actions;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: const Color.fromRGBO(250, 250, 250, 1),
      elevation: 0,
      automaticallyImplyLeading: _isBackOpen,
      leading: _leadingIcon,
      centerTitle: true,
      title: title,
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      backgroundColor: _backgroundColor,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: actions!,
              ),
            ]
          : null,
    );
  }
}
