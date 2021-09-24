import 'package:flutter/material.dart';
import 'package:qtech_task/constant/constant.dart';
import 'package:qtech_task/widgets/dot_view.dart';

class SwiperPageView extends StatelessWidget {
  final Function(int?) onTap;
  final Function() onPosition;
  final String image;
  final int length;
  final int position;

  const SwiperPageView(
      {Key? key,
      required this.onTap,
      required this.onPosition,
      required this.image,
      required this.length,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    return Container(
      width: double.infinity,
      height: 240.0,
      color: mWhite,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: length,
            onPageChanged: onTap,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                child: Image.network(image, fit: BoxFit.cover),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                length,
                (index) => BuildDots(
                  onTap: onPosition,
                  position: index,
                  currentPosition: position,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
