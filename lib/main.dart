import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
  runApp(my_app());
}

class my_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
  var _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.message_outlined,
    Icons.settings_outlined,
    Icons.person_2,
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    const Color basicColor = Color(0xFF242660);
    const Color iconColor = Color(0xFFd2d2d2);
    List<String> interior_img = [
      "https://images.pexels.com/photos/2079249/pexels-photo-2079249.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/2227832/pexels-photo-2227832.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/4450337/pexels-photo-4450337.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://images.pexels.com/photos/5490356/pexels-photo-5490356.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/5490341/pexels-photo-5490341.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/2208891/pexels-photo-2208891.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/4846437/pexels-photo-4846437.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/2442904/pexels-photo-2442904.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/7120030/pexels-photo-7120030.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/6021895/pexels-photo-6021895.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/4846437/pexels-photo-4846437.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/2442904/pexels-photo-2442904.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/7120030/pexels-photo-7120030.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/6021895/pexels-photo-6021895.jpeg?auto=compress&cs=tinysrgb&w=400",
    ];
    List<String> likes_img = [
      "https://images.pexels.com/photos/2208891/pexels-photo-2208891.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/2227832/pexels-photo-2227832.jpeg?auto=compress&cs=tinysrgb&w=400",
      "https://images.pexels.com/photos/7120030/pexels-photo-7120030.jpeg?auto=compress&cs=tinysrgb&w=400",
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: const Image(
                      image: AssetImage('assets/img1.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
                      height: 150,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    child: Container(
                      height: 130,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/profile_img.png'),
                        radius: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mellisa peters ',
                style: TextStyle(
                    fontSize: 25,
                    color: basicColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Interior designer',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 140),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      ' Lagos, ',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      'Nigeria',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    )
                  ],
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 20.0, bottom: 15, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '122',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: basicColor),
                        ),
                        Text(
                          'followers',
                          style: TextStyle(color: basicColor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '67',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: basicColor),
                        ),
                        Text(
                          'following',
                          style: TextStyle(color: basicColor),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '37K',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: basicColor),
                        ),
                        Text(
                          'likes',
                          style: TextStyle(color: basicColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: basicColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 35),
                      ),
                      onPressed: () => null,
                      child: Text('Edit profile')),
                  SizedBox(width: 8),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: basicColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      ),
                      onPressed: () => null,
                      child: Text('Add friends')),
                ],
              ),
              const TabBar(
                indicatorColor: iconColor,
                indicatorWeight: 1.0,
                tabs: [
                  Tab(
                    child: Text(
                      'Photes',
                      style: TextStyle(color: basicColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Likes',
                      style: TextStyle(color: iconColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GridTile(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Image(
                                image: NetworkImage(interior_img[index]),
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                      itemCount: interior_img.length,
                    ),
                    Center(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GridTile(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: Image(
                                  image: NetworkImage(likes_img[index]),
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                        itemCount: likes_img.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: basicColor,
            child: Icon(Icons.add, size: 35, color: Colors.white),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 28,
                    color: index != 3 ? Colors.grey : basicColor,
                  ),
                  const SizedBox(height: 4),
                ],
              );
            },
            activeIndex: _bottomNavIndex,
            notchAndCornersAnimation: borderRadiusAnimation,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.smoothEdge,
            gapLocation: GapLocation.center,
            onTap: (index) => setState(() => _bottomNavIndex = index),
            hideAnimationController: _hideBottomBarAnimationController,
          ),
        ),
      ),
    );
  }
}
