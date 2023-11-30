import 'package:cinema_app/components/btn_primary_ink.dart';
import 'package:cinema_app/models/cast_model.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/theme/app_colors.dart';
import 'package:cinema_app/views/buy/buy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.movie,
    required this.viewDetailMovie,
    required this.animatedInformation,
  }) : super(key: key);

  final MovieModel movie;
  final bool viewDetailMovie;
  final double animatedInformation;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        height: animatedInformation,
        duration: const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          color: AppColors.backgroundApp,
          borderRadius: BorderRadius.only(
            topLeft: viewDetailMovie
                ? const Radius.circular(0.0)
                : const Radius.circular(25.0),
            topRight: viewDetailMovie
                ? const Radius.circular(0.0)
                : const Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            viewDetailMovie
                ? const SizedBox(height: 20.0)
                : Container(
                    width: 60.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        movie.name,
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        movie.type,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "IMDb",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/star.svg',
                                      color: AppColors.pink,
                                      width: 12.0,
                                      height: 12.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      movie.start,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 70.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Time",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  movie.time,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "P-G",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  movie.pg,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  movie.price,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        movie.description,
                        //textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "See all",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          casts.length,
                          (index) => Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage(casts[index].imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  casts[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      BtnPrimaryInk(
                        text: "Buy a tickets",
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, animation, __) => BuyView(
                                movie: movie,
                              ),
                              transitionsBuilder: (_, animation, __, child) =>
                                  FadeTransition(
                                opacity: CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOutQuad),
                                child: child,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
