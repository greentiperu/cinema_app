import 'package:cinema_app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/search.svg',
            color: Colors.white60,
            height: 20.0,
          ),
          const Expanded(
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(),
              placeholder: "Search cinema, movie",
              placeholderStyle: TextStyle(
                color: Colors.white60,
                fontSize: 12.0,
              ),
              cursorColor: AppColors.pink,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
