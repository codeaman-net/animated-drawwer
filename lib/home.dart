import 'package:animated_drawer/home_screen_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  void _toggle() => animationController.isCompleted
      ? animationController.reverse()
      : animationController.forward();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        var scale = 1 - (animationController.value * 0.3);
        var maxSide = MediaQuery.of(context).size.width;
        var side = (maxSide * (animationController.value * 0.6));

        return GestureDetector(
          onTap: _toggle,
          child: Stack(
            children: [
              Material(
                color: Colors.indigo,
                child: SafeArea(
                    child: Theme(
                        data: ThemeData(brightness: Brightness.dark),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 15, bottom: 10),
                                child: Text(
                                  "Demo App",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.new_releases),
                                title: Text("News"),
                              ),
                              ListTile(
                                leading: Icon(Icons.favorite),
                                title: Text("Favorite"),
                              ),
                              ListTile(
                                leading: Icon(Icons.map),
                                title: Text("Map"),
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Account"),
                              ),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Settings"),
                              ),
                              ListTile(
                                leading: Icon(Icons.logout),
                                title: Text("Sign Out"),
                              )
                            ],
                          ),
                        ))),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(side)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: const HomeScreenSection(),
              )
            ],
          ),
        );
      },
    );
  }
}
