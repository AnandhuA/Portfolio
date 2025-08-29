// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class VideoBackground extends StatefulWidget {
  const VideoBackground({super.key});

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late final html.VideoElement _videoElement;

  @override
  void initState() {
    super.initState();

    _videoElement = html.VideoElement()
      ..src = "assets/video/background.mp4"
      ..autoplay = true
      ..loop = true
      ..muted = true
      ..style.objectFit = "cover"
      ..style.width = "100%"
      ..style.height = "100%";
      
    ui.platformViewRegistry.registerViewFactory(
      'videoElement',
      (int viewId) => _videoElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(viewType: 'videoElement');
  }
}