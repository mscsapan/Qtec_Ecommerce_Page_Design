import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtech_task/constant/constant.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  const PriceWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(price,
              style: GoogleFonts.roboto(
                  fontSize: 20.0, color: mPrice1, fontWeight: FontWeight.w700)),
          Text('BDT 2,000,000',
              style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: mPrice2,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400)),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
                backgroundColor: MaterialStateProperty.all<Color>(mPrice1)),
            onPressed: () {},
            child: const Text('50% Off'),
          )
        ],
      ),
    );
  }
}
