import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class MettindOptions extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const MettindOptions({super.key, required this.text, required this.isMute, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(text, style: TextStyle(fontSize: 18),),
          ),
          Switch(value: isMute, onChanged: onChange)
        ],
      ),
    );
  }
}