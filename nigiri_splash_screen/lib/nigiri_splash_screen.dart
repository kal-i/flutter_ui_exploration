import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NagiriSplashScreen extends StatefulWidget {
  const NagiriSplashScreen({super.key});

  @override
  State<NagiriSplashScreen> createState() => _NagiriSplashScreenState();
}

class _NagiriSplashScreenState extends State<NagiriSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _imageSlideAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _bottomSlideAnimation;
  late Animation<double> _bottomFadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(1.0, -1.0),
      end: Offset.zero,
    ).animate(
      curve,
    );

    _titleSlideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.2,
          0.6,
          curve: Curves.easeOut,
        ),
      ),
    );

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _bottomFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SlideTransition(
                  position: _imageSlideAnimation,
                  child: SizedBox.expand(
                    child: Image.asset(
                      'assets/images/sushi-overlay.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: SlideTransition(
                    position: _titleSlideAnimation,
                    child: Text(
                      'NIGIRI',
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF545454),
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: FadeTransition(
              opacity: _bottomFadeAnimation,
              child: SlideTransition(
                position: _bottomSlideAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'FRESHLY\nMADE',
                      style: GoogleFonts.inter(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 5.0,
                      ),
                    ),
                    Text(
                      'A place where freshly made sushi is crafted with love and inspired by the ocean\'s purest flavors.',
                      style: GoogleFonts.inter(
                        fontSize: 13.0,
                        color: Colors.black54,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
