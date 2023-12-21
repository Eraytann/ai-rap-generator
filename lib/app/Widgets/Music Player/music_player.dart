import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../constants.dart';
import '../../rap_generator_icons.dart';

class BuildBeatCards extends StatefulWidget {
  final List<String> apiData;
  final void Function()? onClick;
  final bool isSelected;

  const BuildBeatCards({
    super.key,
    required this.apiData,
    required this.isSelected,
    this.onClick,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BuildBeatCardsState createState() => _BuildBeatCardsState();
}

class _BuildBeatCardsState extends State<BuildBeatCards> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: List.generate(
            widget.apiData.length,
            (index) => buildCard(index),
          ),
        );
      },
    );
  }

  Widget buildCard(int index) {
    return Observer(builder: (_) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
          side: BorderSide(
            color: widget.isSelected ? Colors.pink : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            buildListTile(index),
            if (widget.isSelected)
              Image.asset('assets/images/process/Waves.png'),
          ],
        ),
      );
    });
  }

  ListTile buildListTile(int index) {
    return ListTile(
      minVerticalPadding: 30,
      leading: GestureDetector(
        onTap: () {
          if (widget.onClick != null) {
            widget.onClick!();
          }
        },
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradientButtonColor.createShader(bounds);
          },
          child: Icon(
            widget.isSelected
                ? RapGenerator.pauseIcon
                : RapGenerator.iconPlayBeats,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(widget.apiData[index],
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
