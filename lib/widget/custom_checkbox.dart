import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;

  const CustomCheckBox({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
              activeColor: Colors.white,
              checkColor: Color(0xFF19839A),
              side: MaterialStateBorderSide.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return const BorderSide(color: Colors.grey);
                  }
                  return const BorderSide(color: Colors.grey);
                },
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              value: value,
              onChanged: onChanged),
        ),
      ],
    );
  }
}
class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const CustomText({super.key, required this.text, this.color, this.fontSize, this.fontWeight, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: overflow
      ,style: TextStyle(
        color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),);
  }
}
