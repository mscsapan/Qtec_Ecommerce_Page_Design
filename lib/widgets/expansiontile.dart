import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtech_task/constant/constant.dart';

class BuildExpansionTile extends StatelessWidget {
  final String title;
  const BuildExpansionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 6.0),
      child: Row(
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: const BoxDecoration(
              color: mDarkBlack,
              shape: BoxShape.circle,
            ),
          ),
          Text(title,
              style: GoogleFonts.roboto(
                  fontSize: 18.0, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
