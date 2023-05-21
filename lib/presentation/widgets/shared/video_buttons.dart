import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:animate_do/animate_do.dart';
import '../../../domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtons(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        const SizedBox(height: 20.0),
        _CustomIconButtons(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20.0),
        SpinPerfect(
          duration: const Duration(seconds: 5),
          infinite: true,
          child: const _CustomIconButtons(value: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomIconButtons extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButtons(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData, color: color),
        ),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
