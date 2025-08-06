import 'package:flutter/material.dart';
import 'signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          // Define scalable sizes based on layout constraints
          final logoSize = width * 0.2;
          final titleFontSize = width * 0.12;
          final subtitleFontSize = width * 0.04;
          final taglineFontSize = width * 0.045;
          final buttonPadding = EdgeInsets.symmetric(
            horizontal: width * 0.15,
            vertical: height * 0.02,
          );
          final contentPadding = EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.06,
          );

          return Stack(
            children: [
              // Background image
              Image.asset(
                'images/splash_bg.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),

              // Foreground with overlay gradient and content
              SizedBox.expand(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: contentPadding,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Top: logo and tagline
                          Column(
                            children: [
                              Image.asset(
                                'images/splash_icon.png',
                                width: logoSize,
                                height: logoSize,
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                '100K+ Premium Recipe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: taglineFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          // Middle: title and subtitle
                          Column(
                            children: [
                              Text(
                                'Get\nCooking',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: height * 0.025),
                              Text(
                                'Simple way to find Tasty Recipe',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: subtitleFontSize,
                                ),
                              ),
                            ],
                          ),

                          // Bottom: start button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF119475),
                              padding: buttonPadding,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ),
                              );
                            },
                            child: Text(
                              'Start Cooking',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: taglineFontSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
