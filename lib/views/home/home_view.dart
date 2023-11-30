import 'dart:async';
import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/views/home/widgets/information.dart';
import 'package:cinema_app/views/home/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late MovieModel selectedMovie = movies[currentPage];
  final PageController _pageController = PageController(
    viewportFraction: 0.75,
  );
  int currentPage = 0;
  double animatedBanner = -400;
  double animatedInformation = 230.0;
  bool viewDetailMovie = false;

  //
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      if (_isVisible) {
        _isExpanded = false;
        _animationController.forward();
      } else {
        _isExpanded = true;
        _animationController.reverse();
      }
    });
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        Timer(const Duration(milliseconds: 550), () {
          setState(() {
            _isExpanded = false;
          });
        });
      }
    });
  }

//
  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          //alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600), //400
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      movies[currentPage].imageUrl,
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.9,
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //colors: movies[currentPage].gradientColor,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.7)
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 20.0,
              right: 20.0,
              top: 50.0,
              child: UserAppBar(),
            ),
            Positioned(
              top: 190.0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.0,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) => {
                        setState(
                          () {
                            currentPage = value;
                            selectedMovie = movies[currentPage];
                          },
                        )
                      },
                      itemCount: movies.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            animatedInformation =
                                animatedInformation == 230 ? 600.0 : 230.0;
                            animatedBanner =
                                animatedInformation == 600.0 ? 0 : -400;

                            viewDetailMovie = true;
                            _toggleVisibility();
                            _toggleExpansion();
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            margin: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: index == currentPage ? 25 : 50.0,
                                top: index == currentPage ? 25 : 50.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.45),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(23),
                              color: index == currentPage
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              image: DecorationImage(
                                image: AssetImage(movies[index].imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              left: 0.0,
              right: 0.0,
              top: animatedBanner,
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                duration: const Duration(milliseconds: 1200),
                width: double.infinity,
                height: 380.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.darken,
                      //BlendMode.softLight,
                    ),
                    image: AssetImage(
                      selectedMovie.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButton(
                            color: Colors.white,
                            onPressed: () {
                              animatedInformation =
                                  animatedInformation == 230 ? 600.0 : 230.0;
                              animatedBanner =
                                  animatedInformation == 600.0 ? 0 : -400;
                              _toggleVisibility();
                              viewDetailMovie = false;
                              setState(() {});
                            },
                          ),
                          SvgPicture.asset(
                            'assets/icons/heart.svg',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Information(
              animatedInformation: animatedInformation,
              viewDetailMovie: viewDetailMovie,
              movie: selectedMovie,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: !_isExpanded ? 20.0 : 0,
                    top: !_isExpanded ? 180.0 : 0,
                  ),
                  child: Opacity(
                    opacity: _animation.value,
                    child: Transform.scale(
                      scale: _animation.value,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.decelerate, //decelerate
                        width: _isExpanded
                            ? MediaQuery.of(context).size.width * 0.99
                            : 120.0,
                        height: _isExpanded
                            ? MediaQuery.of(context).size.height * 0.9
                            : 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage(selectedMovie.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
