import 'package:flutter/material.dart';

import '../constants.dart';

class BuildRichTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Color? containerColor;
  final Color? containerShadowColor;
  final double? containerElevation;
  final Border? containerBorder;
  final bool? enabled;
  final bool? readOnly;

  const BuildRichTextField({
    super.key,
    required TextEditingController textController,
    this.onChanged,
    this.containerColor,
    this.containerShadowColor,
    this.containerElevation,
    this.containerBorder,
    this.enabled,
    this.readOnly,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: containerBorder ??
            const Border(
              top: BorderSide(color: Color.fromARGB(24, 0, 0, 0), width: 1),
            ),
        color: containerColor,
      ),
      child: PhysicalModel(
        color: containerColor ?? Colors.white,
        shadowColor: containerShadowColor ?? const Color.fromARGB(64, 0, 0, 0),
        elevation: containerElevation ?? 2,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(13),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            autofocus: false,
            keyboardType: TextInputType.text,
            readOnly: readOnly ?? false,
            enabled: enabled,
            controller: _textController,
            cursorColor: Colors.black,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: promptTextSemanticLabel,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
