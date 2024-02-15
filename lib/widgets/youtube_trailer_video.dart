import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeTrailerPlayer extends StatefulWidget {
  final String animeTrailerUrl;
  YoutubeTrailerPlayer({required this.animeTrailerUrl});
  @override
  State<YoutubeTrailerPlayer> createState() => _YoutubeTrailerPlayerState();
}

class _YoutubeTrailerPlayerState extends State<YoutubeTrailerPlayer> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  @override
  void initState() {
    super.initState();
    _initializeYoutubePlayer();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeYoutubePlayer() {
    // Extract video ID from the URL

    // Initialize the YoutubePlayerController
    _controller = YoutubePlayerController(
      initialVideoId: widget.animeTrailerUrl,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
        ),
        onReady: () {
          // Do something when player is ready
        },
      ),
      builder: (context, player) {
        return Container(
          child: Center(
            child: player,
          ),
        );
      },
    );
  }
}
