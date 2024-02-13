import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  int _selectedIndex = 0;
  double textSize = 45.0;

  @override
  Widget build(BuildContext context) {
    final List<String> _demoImages = [
      'assets/icons/dashboard.png',
      'assets/icons/cart.png',
      'assets/icons/bag.png',
      'assets/icons/message.png',
      'assets/icons/user.png',
      'assets/icons/setting.png',
      'assets/icons/exit.png',
    ];

    final List<String> _demoTitles = [
      'Dashboard',
      'Cart',
      'Bag',
      'Message',
      'User',
      'Setting',
      'Exit',
    ];

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        width: isExpanded ? 300.0 : 90.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.deepPurple.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: isExpanded ? 0.0 : 1.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                height: isExpanded ? 0.0 : 50.0,
                width: isExpanded ? 0.0 : 50.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                    child: Text(
                      'iP',
                    ),
                  ),
                ),
              ),
            ),
            if (isExpanded)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: isExpanded ? 1.0 : 0.0,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                  ),
                  child: const Text(
                    'iPay',
                  ),
                ),
              ),
            const SizedBox(height: 16.0 * 2),
            SizedBox(
              child: ListView.builder(
                itemCount: _demoImages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: isExpanded
                        ? () {
                            setState(() {
                              _selectedIndex = index;
                              textSize = 60.0;
                            });
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0 * 2, left: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height: 65,
                        decoration: BoxDecoration(
                            color: isExpanded
                                ? _selectedIndex == index
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.transparent
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              Image.asset(
                                _demoImages[index],
                                height: isExpanded ? 40 : 30,
                                width: isExpanded ? 40 : 30,
                                color: isExpanded
                                    ? _selectedIndex == index
                                        ? Colors.white
                                        : Colors.white54
                                    : Colors.white54,
                              ),
                              const SizedBox(width: 16.0),
                              if (isExpanded)
                                Expanded(
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: isExpanded ? 1.0 : 0.0,
                                    child: AnimatedDefaultTextStyle(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.white54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isExpanded ? 18 : 0,
                                      ),
                                      child: Text(
                                        _demoTitles[index],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            AnimatedAlign(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              alignment:
                  isExpanded ? Alignment.bottomRight : Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                          textSize = 45.0;
                        });
                      },
                      icon: Icon(
                        isExpanded
                            ? Icons.arrow_back_ios
                            : Icons.arrow_forward_ios,
                        color: Colors.deepPurple,
                      ),
                    ),
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
