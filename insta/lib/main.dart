
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _stories = [
    "https://images.pexels.com/photos/9706057/pexels-photo-9706057.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/9706057/pexels-photo-9706057.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/6501785/pexels-photo-6501785.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/9671090/pexels-photo-9671090.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/2554870/pexels-photo-2554870.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/2520446/pexels-photo-2520446.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/2479832/pexels-photo-2479832.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
        "https://images.pexels.com/photos/3204413/pexels-photo-3204413.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),

      //PRIMEIRO MENU, ONDE TEM ESCRITO INSTAGRAM, O DIRECT, E A TV
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Feather.tv,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesome.send_o),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(),
              Row(
                children: <Widget>[
                  Text(
                    "Stories",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: _stories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return Image(
                    image: NetworkImage(_stories[i]),
                    width: 200,
                    height: 200,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
