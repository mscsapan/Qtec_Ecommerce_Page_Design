import 'package:flutter/material.dart';
import 'package:qtech_task/constant/constant.dart';
import 'package:qtech_task/list/item_list.dart';

import 'expansiontile.dart';

class ExpansionItem extends StatelessWidget {
  const ExpansionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpansionTile(
              collapsedBackgroundColor: Colors.transparent,
              initiallyExpanded: true,
              childrenPadding: const EdgeInsets.all(12.0).copyWith(top: 0.0),
              title: Text('Description', style: titleStyle()),
              children: List.generate(expansion.length,
                  (index) => BuildExpansionTile(title: expansion[index])),
            ),
            ExpansionTile(
              collapsedBackgroundColor: Colors.transparent,
              initiallyExpanded: true,
              childrenPadding: const EdgeInsets.all(12.0).copyWith(top: 0.0),
              title: Text('Additional Information', style: titleStyle()),
              children: List.generate(additionalInfo.length,
                  (index) => BuildExpansionTile(title: additionalInfo[index])),
            ),
          ],
        ),
      ),
    );
  }
}
