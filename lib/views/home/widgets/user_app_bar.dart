import 'package:cinema_app/views/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/user.jpeg"),
            ),
            const SizedBox(width: 10.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Kay Jay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Book your favorite movie',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/notifications.svg',
            ),
          ],
        ),
        const Search()
      ],
    );
  }
}
