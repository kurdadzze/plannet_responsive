import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

class PlanetModel {
  final String name;
  final String photo;


  PlanetModel({this.name, this.photo});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = [
    PlanetModel(
      name: 'Earth',
      photo:
          'https://freepngimg.com/thumb/earth/6-2-earth-png-clipart.png',
    ),
    PlanetModel(
      name: 'Mars',
      photo:
          'https://www.freepnglogos.com/uploads/mars-png/mars-transparent-png-stickpng-0.png',
    ),
    PlanetModel(
      name: 'Mercury',
      photo:
          'https://th.bing.com/th/id/OIP.rZut7p0QmwTg47U8h1FezwHaFi?pid=ImgDet&rs=1',
    ),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    print(orientation);

    if (orientation == Orientation.portrait) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Planets"),
        ),
        body: Column(
          children: [
            SizedBox(height: 36),
            Expanded(
              child: ImageWithTitle(
                title: items[activeIndex].name,
                image: items[activeIndex].photo,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('  Earth  '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeIndex = 0;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('  Mars  '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeIndex = 1;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Mercury'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        activeIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planets"),
      ),
      body: Row(
        children: [
          Expanded(
            child: ImageWithTitle(
              title: items[activeIndex].name,
              image: items[activeIndex].photo,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                  // elevation: 8,
                  child: Text('  Earth  '),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                ),
                ElevatedButton(
                  // elevation: 8,
                  child: Text('  Mars  '),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),

                  onPressed: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                ),
                ElevatedButton(
                  // elevation: 8,

                  child: Text('Mercury'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      activeIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWithTitle extends StatelessWidget {
  final String title;
  final String image;

  ImageWithTitle({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text(
          title,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        Expanded(child: Image.network(image)),
      ],
    );
  }
}
