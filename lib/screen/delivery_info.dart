import 'package:flutter/material.dart';
import 'package:qtech_task/constant/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({Key? key}) : super(key: key);
  final String cash = 'Cash on Delivery not available';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Information',
            style: titleStyle(),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.truck, size: 16.0),
              const SizedBox(width: 8.0),
              Text('Sent from Dhaka will arrive 7/10 working days',
                  style: subTitleStyle()),
            ],
          ),
          const SizedBox(height: 15.0),
          Text(
            'Payment Method (Supported)',
            style: titleStyle(),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              paymentMethod(FontAwesomeIcons.checkCircle, 'Bkash', mGreen!),
              const SizedBox(width: 10.0),
              paymentMethod(FontAwesomeIcons.timesCircle, cash, mRed),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: paymentMethod(
                    FontAwesomeIcons.checkCircle, 'Bkash', mGreen!),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget paymentMethod(IconData icon, String title, Color color) => Row(
      children: [
        FaIcon(icon, size: 18.0, color: color),
        const SizedBox(width: 5.0),
        Text(title, style: subTitleStyle())
      ],
    );
