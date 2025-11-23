import 'package:flutter/material.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6EC1FF),
              Color(0xFF5BA8FF),
              Color(0xFF4290FF),
              Color(0xFF2B78FF),
              Color(0xFF1A60EB),
              Color(0xFF1552D6),
              Color(0xFF1044C2),
            ],
            stops: [0.0, 0.15, 0.30, 0.50, 0.70, 0.85, 1.0],
          ),
        ),
        child: FadeTransition(
          opacity: _opacity,
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Matule',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        blurRadius: 30,
                        color: Colors.white30,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '2026',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                    letterSpacing: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}