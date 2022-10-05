import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SheetItem extends StatelessWidget {
  final String sheetItem;
  final IconData icon;
  final Color color;

  const SheetItem(
      {required this.sheetItem,
      required this.icon,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffedf4fe),
              borderRadius: BorderRadius.circular(20.0)),
          width: MediaQuery.of(context).size.width * 0.2,
          height: 75,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          sheetItem,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
