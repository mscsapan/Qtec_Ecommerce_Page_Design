import 'package:flutter/material.dart';
import 'package:qtech_task/constant/constant.dart';

class FourButton extends StatefulWidget {
  const FourButton({Key? key}) : super(key: key);

  @override
  State<FourButton> createState() => _FourButtonState();
}

class _FourButtonState extends State<FourButton> {
  List<String> name = [
    'Black',
    'Yellow',
    'Red',
    'Blue',
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: List.generate(
            4,
            (index) => buildButton(
                onTap: () => setState(() => current = index),
                current: current,
                index: index,
                name: name[index])),
      ),
    );
  }
}

Widget buildButton(
    {required Function() onTap,
    required String name,
    required int index,
    required int current}) {
  return Container(
    margin: const EdgeInsets.only(right: 6.0),
    child: OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              index == 1 ? mYellow : mTransparent),
          side: MaterialStateProperty.all<BorderSide>(BorderSide(
              color: index == 0
                  ? mDarkBlack
                  : index == 1
                      ? mTransparent
                      : index == 2
                          ? mRed
                          : mBlue))),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
        child: Text(
          name,
          style: TextStyle(
            color: index == 0
                ? mDarkBlack
                : index == 1
                    ? mWhite
                    : index == 2
                        ? mRed
                        : mBlue,
          ),
        ),
      ),
    ),
  );
}
