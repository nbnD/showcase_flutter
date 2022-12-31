import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _first = GlobalKey(); //you can define GlobalKey
  final _second = GlobalKey(); //or keep it as final
  final _third = GlobalKey();
  final _fourth = GlobalKey();
  final _fifth = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)
          .startShowCase([_first, _second, _third, _fourth, _fifth]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Welcome to Flutter Junction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(5),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Image.asset('assets/flutterjunction.png'),
              ),
              title: const Text("Flutter Junction"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: Showcase(
          key: _first,
          description: 'Press here to open drawer',
          child: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
         title: Showcase(
            key: _second,
            description: 'Subscribe for more videos',
            child: const Text(
              'Flutter Junction',
              style: TextStyle(color: Colors.blue),
            )),
        actions: [
          Showcase(
            key: _third,
            description: 'Press to view Profile',
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Image.asset('assets/flutterjunction.png'),
            ),
          )
        ],
       
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Showcase(
                key: _fourth,
                description:
                    'Flutter Junction specializes in youtubing important topics in FLutter ',
                child: Image.asset(
                  "assets/flutterjunction.png",
                  height: 400,
                  width: 350,
                )),
          )
        ],
      ),
      floatingActionButton: Showcase(
        key: _fifth,
        title: 'Favorite',
        description: 'Click here to add wishlist',
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
          child: const Icon(
            Icons.favorite,
          ),
        ),
      ),
    );
  }
}
