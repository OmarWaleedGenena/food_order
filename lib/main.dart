import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Orders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Food Orders'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 230, 30, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {}),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: IconButton(
                icon: Icon(Icons.filter_list),
                color: Colors.white,
                onPressed: () {}),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: IconButton(
                icon: Icon(Icons.menu), color: Colors.white, onPressed: () {}),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                Text(
                  'Genena',
                  style: TextStyle(
                      fontFamily: 'Rakkas', fontSize: 27, color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Restaurant',
                  style: TextStyle(
                      fontFamily: 'Rakkas', fontSize: 27, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75))),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25, right: 25),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView(
                      children: <Widget>[
                        _foodItem("assets/images/beef.jpg", "Beef", "\$ 55"),
                        _foodItem(
                            "assets/images/burger.jpg", "Burger", "\$ 45"),
                        _foodItem(
                            "assets/images/chicken.jpg", "Chicken", "\$ 50"),
                        _foodItem("assets/images/rice.jpg", "Rice", "\$ 20"),
                        _foodItem("assets/images/pasta.jpg", "Pasta", "\$ 25"),
                        _foodItem("assets/images/salad.jpg", "Salad", "\$ 20"),
                        _foodItem("assets/images/cake.jpg", "Cake", "\$ 30"),
                        _foodItem("assets/images/juice.jpg", "Juice", "\$ 15"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _foodItem(String imgpath, String foodname, String price) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(imgpath, foodname, price)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: imgpath,
                      child: Image(
                        image: AssetImage(imgpath),
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodname,
                        style: TextStyle(
                            fontFamily: 'Rakkas',
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'Rakkas',
                            fontSize: 15,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
