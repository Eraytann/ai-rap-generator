import 'package:flutter/material.dart';
import '../../../rap_generator_icons.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    this.onPressed,
    this.onTap,
  });

  final String text;
  final void Function()? onPressed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 30,
      tileColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
      ),
      title: Text(text),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          RapGenerator.iconNext,
          color: Colors.black,
        ),
      ),
    );
  }
}
