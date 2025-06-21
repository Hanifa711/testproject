import 'package:flutter/material.dart';
import 'package:myshop/core/constant/app_colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool active;

  const CustomButtonAppBar({
    super.key,
    required this.textbutton,
    required this.icondata,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: active ? MyColors.green : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 45,
          height: 45,
          child: Icon(
            icondata,
            color: active ? MyColors.white : Colors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}
