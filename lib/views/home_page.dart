import 'package:flutter/material.dart';
import 'package:flutter_animated_sidebar/controller/theme_controller.dart';
import 'package:provider/provider.dart';

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

    final List<String> userImages = [
      'https://img.freepik.com/premium-photo/young-african-female-with-braided-hair_126745-3751.jpg',
      'https://img.freepik.com/free-photo/portrait-young-woman-with-natural-make-up_23-2149084942.jpg',
      'https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg',
      'https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg',
    ];

    final List<String> userNames = [
      'Tushar Mahmud',
      'Rahul Dutta',
      'Rohit Das',
      'Raj Kapoor',
    ];
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            width: isExpanded ? 250.0 : 70.0,
            decoration: BoxDecoration(
              color: themeNotifier.isDarkMode
                  ? Colors.grey[300]
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (!isExpanded) const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: isExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        height: 10.0,
                        width: isExpanded ? 10.0 : 10.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        height: 10.0,
                        width: isExpanded ? 10.0 : 10.0,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        height: 10.0,
                        width: isExpanded ? 10.0 : 10.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      const Spacer(),
                      if (isExpanded)
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              themeNotifier.toggleTheme();
                            },
                            icon: Icon(
                              themeNotifier.isDarkMode
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
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
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          color: Colors.white,
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
                const SizedBox(height: 16.0 * 2),
                ListView.builder(
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
                        padding:
                            const EdgeInsets.only(top: 16.0 * 2, left: 10.0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: isExpanded
                                ? _selectedIndex == index
                                    ? Colors.deepPurple.withOpacity(0.3)
                                    : Colors.transparent
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  _demoImages[index],
                                  height: isExpanded ? 20 : 20,
                                  width: isExpanded ? 20 : 20,
                                  color: isExpanded
                                      ? _selectedIndex == index
                                          ? Colors.black
                                          : Colors.grey
                                      : Colors.grey,
                                ),
                                const SizedBox(width: 16.0),
                                if (isExpanded)
                                  Expanded(
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity: isExpanded ? 1.0 : 0.0,
                                      child: AnimatedDefaultTextStyle(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: _selectedIndex == index
                                              ? Colors.black
                                              : Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isExpanded ? 15 : 0,
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
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                  height: 150.0,
                  width: isExpanded ? 220.0 : 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: isExpanded ? 16.0 : 20.0,
                              top: 10.0,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 10.0,
                                  backgroundImage:
                                      NetworkImage(userImages[index]),
                                ),
                                const SizedBox(width: 16.0),
                                AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.easeInOut,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isExpanded ? 13 : 0,
                                  ),
                                  child: Text(
                                    userNames[index],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
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
                            size: isExpanded ? 20 : 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          color: themeNotifier.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(
                          _demoTitles[_selectedIndex],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Your Content Here...',
                        style: TextStyle(
                          color: themeNotifier.isDarkMode
                              ? Colors.white
                              : Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
