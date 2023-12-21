import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Screens/home/view/home_view.dart';
import 'package:rap_generator/app/Screens/song/viewmodel/song_view_model.dart';
import 'package:rap_generator/app/Screens/song/widgets/alert_widget.dart';
import 'package:rap_generator/app/Widgets/elevated_button_widget.dart';
import '../../../Navigation/navigator.dart';
import '../../../constants.dart';
import '../../../rap_generator_icons.dart';

double directionInRadians = -90 * (pi / 180);
double distance = 2.0;

class SongView extends StatefulWidget {
  const SongView({super.key});

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView> {
  bool clicked = false;
  final SongViewModel viewModel = GetIt.I.get<SongViewModel>();

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  late StreamSubscription<PlayerState> playerStateChangedSubscription;
  late StreamSubscription<Duration> durationChangedSubscription;
  late StreamSubscription<Duration> positionChangedSubscription;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();
    setupPlayerState();
  }

  void setupPlayerState() {
    playerStateChangedSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    durationChangedSubscription =
        player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    positionChangedSubscription =
        player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    playerStateChangedSubscription.cancel();
    durationChangedSubscription.cancel();
    positionChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (_) {
            return Column(
              children: [
                Stack(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Image.asset(
                        rapperImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Observer(
                        builder: (_) {
                          return IconButton(
                            onPressed: () {
                              Navigation.push(page: const HomeView());
                            },
                            color: whiteIcon,
                            icon: const Icon(RapGenerator.iconCross),
                          );
                        },
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: OverlayWidget(),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'King of The Hustle',
                      style: TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Rumble Rhymer',
                      style: TextStyle(fontSize: 22),
                    ),
                    Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      activeColor: Colors.pink,
                      thumbColor: Colors.black,
                      inactiveColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          final position = Duration(seconds: value.toInt());
                          player.seek(position);
                          player.resume();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position.inSeconds)),
                          Text(formatTime((duration - position).inSeconds)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return gradientButtonColor.createShader(bounds);
                              },
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    rewindAudio();
                                  });
                                },
                                icon: const Icon(
                                  RapGenerator.iconBackSong,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: gradientButtonColor,
                              ),
                              child: IconButton(
                                color: whiteIcon,
                                onPressed: () {
                                  if (isPlaying) {
                                    player.pause();
                                  } else {
                                    if (viewModel.createdSong?.mixUrl
                                            .toString() !=
                                        null) {
                                      player.play(
                                        UrlSource(
                                          viewModel.createdSong!.mixUrl
                                              .toString(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                icon: Icon(
                                  isPlaying
                                      ? RapGenerator.iconPauseSong
                                      : RapGenerator.iconPlaySong,
                                  size: 50,
                                ),
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return gradientButtonColor.createShader(bounds);
                              },
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    fastForwardAudio();
                                  });
                                },
                                icon: const Icon(
                                  RapGenerator.iconForwardSong,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ElevatedButtonWidget(
                          onPressed: () {
                            setState(
                              () {
                                saveButtonFunc(context);
                              },
                            );
                          },
                          color: Colors.white,
                          gradient: gradientButtonColor,
                          text: elevatedButtonSave,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void saveButtonFunc(BuildContext context) {
    if (clicked == false) {
      viewModel.addLocal(
        viewModel.createdSong!.mixUrl.toString(),
        viewModel.createdSong!.title.toString(),
      );
      clicked = true;
    } else {
      showAlertDialog(context);
    }
  }

  void fastForwardAudio() {
    final newPosition = position + const Duration(seconds: 15);
    player.seek(newPosition);
  }

  void rewindAudio() {
    final newPosition = position - const Duration(seconds: 15);
    player.seek(newPosition);
  }
}

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, 350.0),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              spreadRadius: 60.0,
              blurRadius: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
