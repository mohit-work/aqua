import 'package:flutter/material.dart';
import 'dart:async' show Timer;
import 'dart:math';

// Import other pages
import 'feedback.dart';
import 'rate.dart';
import 'contact.dart';
import 'graph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static ThemeMode themeMode = ThemeMode.system;

  static void updateThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  @override
  _MyAppState createState() => _MyAppState();

  static ThemeMode get currentThemeMode => themeMode;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chlorine Level Monitor',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.lightBlueAccent,
        ),
        scaffoldBackgroundColor: Colors.lightBlue[50],
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.black87,
          ),
          bodyText2: TextStyle(
            color: Colors.black87,
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white70, // Adjusted to a lighter shade of white
          ),
          bodyText2: TextStyle(
            color: Colors.white70, // Adjusted to a lighter shade of white
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      themeMode: MyApp.currentThemeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => ChlorineLevelScreen(),
        '/graph': (context) => GraphScreen(),
      },
    );
  }
}

class ChlorineLevelScreen extends StatefulWidget {
  @override
  _ChlorineLevelScreenState createState() => _ChlorineLevelScreenState();
}

class _ChlorineLevelScreenState extends State<ChlorineLevelScreen>
    with SingleTickerProviderStateMixin {
  late double _chlorineLevel;
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Timer _timer;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();

    _chlorineLevel = 0.0;

    // Start generating random data every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Generate random chlorine level between 0 and 10
        _chlorineLevel = Random().nextDouble() * 10;
        if (_chlorineLevel > 10) {
          _chlorineLevel = 10; // Limit to maximum value of 10
        }
      });
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chlorine Level Monitor'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Live Chlorine Level:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _chlorineLevel.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/graph');
                        },
                        child: Text('View Graph'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.surface,
              ],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  'User Feedback',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Give Feedback',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FeedbackPage(), // Navigate to the FeedbackPage
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Rate Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RatePage(), // Navigate to the RatePage
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ContactPage(), // Navigate to the ContactPage
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
            // Toggle between light and dark themes
            ThemeMode currentMode =
                isDarkMode ? ThemeMode.dark : ThemeMode.light;
            MyApp.updateThemeMode(currentMode);
            if (currentMode == ThemeMode.light) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Switching to Light Theme')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Switching to Dark Theme')),
              );
            }
          });
        },
        child: Icon(
          isDarkMode ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }
}
