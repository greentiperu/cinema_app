import 'package:cinema_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BtnPrimaryInk extends StatelessWidget {
  const BtnPrimaryInk({
    Key? key,
    this.icon,
    required this.text,
    this.onTap,
    this.margin,
    this.showBoxShadow = true,
  }) : super(key: key);

  final Widget? icon;
  final String text;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  final bool showBoxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: showBoxShadow
            ? [
                BoxShadow(
                  color: AppColors.pink.withOpacity(0.25),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                icon != null ? const SizedBox(width: 10.0) : const SizedBox(),
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
