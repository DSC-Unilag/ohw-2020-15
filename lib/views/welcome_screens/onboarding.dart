import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dashboard.dart';
import '../../utilities/style.dart' as Style;

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int page = 0;

  navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => Dashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.themeBlueLight,
      body: CustomPaint(
        painter: OnboardingScreenBackground(),
        child: Container(
          constraints: BoxConstraints.tight(MediaQuery.of(context).size),
          margin: const EdgeInsets.fromLTRB(32, 56, 32, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {},
                constraints: BoxConstraints.tightFor(width: 48, height: 40),
                child: Text(
                  'Skip',
                  textAlign: TextAlign.right,
                ),
                elevation: 0,
              ),
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int currentPage) {
                    setState(() {
                      page = currentPage;
                    });
                  },
                  itemCount: onboardingTexts.length,
                  itemBuilder: (_, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Spacer(flex: 2),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 295),
                            child: Text(
                              '${onboardingTexts[index][0]}',
                              style: Style.body1.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 195),
                            child: Text(
                              '${onboardingTexts[index][1]}',
                              style: Style.body2.copyWith(
                                color: Style.textWhiteColor,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 40,
                width: double.maxFinite,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      width: 56,
                      child: IconButton(
                          icon: Icon(
                            Icons.keyboard_backspace,
                            color: Style.themeBlack,
                            textDirection: TextDirection.rtl,
                          ),
                          onPressed: () {
                            if (_pageController.page <
                                onboardingTexts.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInExpo,
                              );
                            } else {
                              navigateToSignUp(context);
                            }
                          }),
                    ),
                    for (int i = 0; i < onboardingTexts.length; i++)
                      Positioned(
                        bottom: 0,
                        right: 120 + (i * 26).toDouble(),
                        child: Container(
                          width: 10,
                          height: 10,
                          color: Style.themeGrey,
                        ),
                      ),
                    AnimatedPositioned(
                      bottom: 0,
                      right: 157 - (page * 26).toDouble(),
                      child: Icon(
                        Style.OhwExamAppIcons.ohwExamAppIcon,
                        color: Style.themeWhite,
                        size: 40,
                      ),
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInExpo,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreenBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Size sizeForPaint = Size(size.width.clamp(50.0, 380.0), size.height);
    Paint arcPaint = Paint()
      ..color = Style.themeGreen
      ..style = PaintingStyle.fill;

    Path arcPath = Path()
      ..moveTo(size.width - sizeForPaint.width, sizeForPaint.height)
      ..arcToPoint(Offset(size.width, sizeForPaint.height - sizeForPaint.width),
          radius: Radius.circular(size.width))
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(arcPath, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

const onboardingTexts = {
  0: [
    "Create and administer examinations with ease",
    "Create an institution and add an Exam. \nWe’ll handle everything else!"
  ],
  1: [
    "Take exams from your mobile device anywhere.",
    "Register under an institution and take their exams directly from your mobile."
  ],
  2: [
    " See your results almost instantly with autograder.",
    "Your attempt is graded with a corresponding marking scheme so you can see your results immediately."
  ],
};
