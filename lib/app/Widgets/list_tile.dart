import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color? color;
  final String text;
  final IconData? iconData;
  final VoidCallback? onIconPressed;

  const CustomListTile({
    super.key,
    this.color,
    required this.text,
    this.iconData,
    this.onIconPressed,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        leading: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: Icon(
            iconData,
            color: Colors.white,
          ),
          onPressed: onIconPressed,
        ),
      ),
    );
  }
}
