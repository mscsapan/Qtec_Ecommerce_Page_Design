import 'package:flutter/material.dart';
import 'package:qtech_task/constant/constant.dart';

class BuildDots extends StatelessWidget {
  final int position;
  final int currentPosition;
  final Function() onTap;

  const BuildDots(
      {Key? key,
      required this.position,
      required this.currentPosition,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: currentPosition == position ? 12 : 8.0,
        width: currentPosition == position ? 12 : 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
        decoration: BoxDecoration(
          color: currentPosition == position ? mActiveDot : mDeActiveDot,
          borderRadius: currentPosition == position
              ? BorderRadius.circular(6.0)
              : BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
