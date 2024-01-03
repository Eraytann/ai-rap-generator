import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rap_generator/app/Constants/padding_class.dart';
import 'package:rap_generator/app/Local/model/data_model.dart';
import 'package:rap_generator/app/Screens/song_creator/widgets/bottom_overlay.dart';
import 'package:rap_generator/app/Screens/song_creator/widgets/plus_button.dart';
import 'package:rap_generator/app/Widgets/app_bar_widget.dart';
import '../../../Constants/color_class.dart';
import '../../../Constants/text_class.dart';
import '../../../rap_generator_icons.dart';

import '../viewmodel/song_creator_view_model.dart';

final _savedBox = Hive.box<DataModel>('songs');
int boxLength = _savedBox.length;

final viewModel = SongCreatorViewModel();

class SongCreatorView extends StatefulWidget {
  const SongCreatorView({super.key});

  @override
  State<SongCreatorView> createState() => _SongCreatorViewState();
}

class _SongCreatorViewState extends State<SongCreatorView> {
  @override
  void dispose() {
    super.dispose();
    viewModel.stopAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackOpen: true,
        leadingIcon: IconButton(
          onPressed: () => viewModel.closePage(),
          icon: const Icon(RapGenerator.iconPrevious),
        ),
      ),
      body: const Stack(
        children: [
          BuildGridView(),
          BottomOverlayWidget(),
          PlusButtonWidget(),
        ],
      ),
    );
  }
}

class BuildGridView extends StatelessWidget {
  const BuildGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ValueListenableBuilder(
          valueListenable: _savedBox.listenable(),
          builder: (context, Box<DataModel> box, _) {
            return Padding(
              padding: PaddingSizing.smallHorizontal,
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: PaddingSizing.smallEdgeInsetsOnlyL,
                        child: Text(createdSongsTitle),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 245,
                        ),
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final song = box.getAt(index)!;
                          return GridItem(
                            index: index,
                            song: song,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}

class GridItem extends StatefulWidget {
  final DataModel song;
  final int index;

  const GridItem({
    super.key,
    required this.index,
    required this.song,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    double customSBoxHeight = 245;
    const edgeInsetsOnly = EdgeInsets.only(bottom: 15.0, left: 10, right: 10);

    return Padding(
      padding: PaddingSizing.smallEdgeAll,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: SizedBox(
          height: customSBoxHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                widget.song.imageUrl,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: edgeInsetsOnly,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      (widget.song.title.length > 15)
                          ? widget.song.title.substring(0, 15)
                          : widget.song.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: TextColorLibrary.whiteTextColor,
                      ),
                    ),
                    Observer(builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          viewModel.handlePlayButton(
                              widget.index, widget.song.songUrl);
                        },
                        child: Icon(
                          viewModel.isButtonClickedList[widget.index]
                              ? RapGenerator.pauseIcon
                              : RapGenerator.iconPlay,
                          color: ButtonColorLibrary.defaultButtonColor,
                        ),
                      );
                    })
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 5,
                child: Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: const Icon(
                      RapGenerator.icon3dots,
                      color: LayoutColorLibrary.whiteIcon,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: PaddingSizing.midEdgeAll,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text(shareLabel),
                onTap: () {
                  viewModel.sharePressed();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(renameText),
                onTap: () {
                  Navigator.pop(context);
                  showRenameDialog(context, _controller, widget.index);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text(deleteButtonText),
                onTap: () {
                  setState(
                    () {
                      viewModel.deleteSong(widget.index);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showRenameDialog(
      BuildContext context, TextEditingController controller, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(renameSong),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: renameDialogLabel),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            Observer(
              builder: (_) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      viewModel.updateTitle(controller, index);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Rename'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
