import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'Tabar / BottomNavigationBar';

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), // For Swipe Scroll Stop
        children: <Widget>[
          TopTabBar(),
          Center(
              child: Text(
            'Category',
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            'Search',
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            'Cart',
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            'Profile',
            style: TextStyle(fontSize: 32.0),
          )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFC41A3B),
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.0),
          ),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 12.0),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.category),
              text: 'Category',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
              text: 'Cart',
            ),
            Tab(
              icon: Icon(Icons.person),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class TopTabBar extends StatefulWidget {
  TopTabBar({Key key}) : super(key: key);

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Color(0xFFC41A3B),
          child: TabBar(
            controller: _tabController,
            // indicator: UnderlineTabIndicator(
            //   borderSide: BorderSide(width: 0.0),
            // ),
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              Tab(
                text: 'Paid'.toUpperCase(),
              ),
              Tab(
                text: 'UnPaid'.toUpperCase(),
              ),
              Tab(
                text: 'All'.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), // For Swipe Scroll Stop
        children: <Widget>[
          Center(
              child: Text(
            'Paid',
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            'UnPaid',
            style: TextStyle(fontSize: 32.0),
          )),
          Center(
              child: Text(
            'All',
            style: TextStyle(fontSize: 32.0),
          )),
        ],
      ),
    );
  }
}
