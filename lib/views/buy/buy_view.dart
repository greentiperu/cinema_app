import 'package:cinema_app/components/btn_primary_ink.dart';
import 'package:cinema_app/components/follow_me.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class BuyView extends StatefulWidget {
  const BuyView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  BuyViewState createState() => BuyViewState();
}

class BuyViewState extends State<BuyView> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;

  late Animation<double> animation;

  List<List<bool>> selectedSeats = [
    List.generate(3, (index) => false),
    List.generate(5, (index) => false),
    List.generate(7, (index) => false),
    List.generate(9, (index) => false),
    List.generate(9, (index) => false),
    List.generate(9, (index) => false),
    List.generate(9, (index) => false),
    List.generate(9, (index) => false),
    List.generate(9, (index) => false),
    List.generate(7, (index) => false),
  ];

  List<List<bool>> group1Seats = [];
  List<List<bool>> group2Seats = [];

  List<String> hours = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00'
  ];
  int selectedIndex = -1;

  bool seatsPosition = false;
  bool lightPosition = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.movie.movieUrl,
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: false),
    )..initialize().then((_) {
        _controller.play();
        setState(() {});
      });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();

    int midRow = selectedSeats.length ~/ 2;
    group1Seats = selectedSeats.sublist(0, midRow);
    group2Seats = selectedSeats.sublist(midRow);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundApp,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundApp,
        title: Column(
          children: [
            Text(
              widget.movie.name,
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.movie.type,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            left: 47.0,
            right: 47.0,
            top: lightPosition ? 131.5 : 180.0,
            duration: const Duration(milliseconds: 1400),
            curve: Curves.easeOut,
            child: Container(
              width: 250.0,
              height: 20.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  seatsPosition = true;
                  lightPosition = true;
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(1.30 * animation.value),
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: animation.value,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedPositioned(
            //width: selected ? 200.0 : 50.0,
            //height: selected ? 50.0 : 200.0,
            left: 0,
            right: 0,
            top: seatsPosition ? 140.0 : 180.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: [
                for (var i = 0; i < selectedSeats.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var j = 0; j < selectedSeats[i].length; j++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSeats[i][j] = !selectedSeats[i][j];
                            });
                          },
                          child: Container(
                            width: 18.0,
                            height: 18.0,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: selectedSeats[i][j]
                                  ? AppColors.pink
                                  : AppColors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: selectedSeats[i][j]
                                    ? AppColors.pink
                                    : AppColors.grey,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          "Available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          "Reserved",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Text(
                          "Selected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 35.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hours.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: selectedIndex == index
                                  ? AppColors.pink
                                  : Colors.white12,
                            ),
                          ),
                          child: Text(
                            hours[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? AppColors.pink
                                  : Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "\$7,00  ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "per seats",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Total: \$0,00",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: BtnPrimaryInk(
                    text: "Buy a tickets",
                    onTap: () {
                      _controller.dispose();
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, animation, __) => const FollowMe(),
                          transitionsBuilder: (_, animation, __, child) =>
                              FadeTransition(
                            opacity: CurvedAnimation(
                                parent: animation, curve: Curves.easeOutQuad),
                            child: child,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
