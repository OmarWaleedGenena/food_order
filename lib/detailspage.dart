import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class DetailsPage extends StatefulWidget {
  final herotag;
  final name;
  final price;

  DetailsPage(this.herotag, this.name, this.price);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = "white";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 230, 30, 1),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Text(
            widget.name,
            style: TextStyle(
                fontFamily: 'Rakkas', fontSize: 25, color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 75,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.herotag,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: AssetImage(widget.herotag),
                            fit: BoxFit.cover)),
                  ),
                ),
                height: 200,
                width: 200,
              ),
              Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Rakkas',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.price,
                            style: TextStyle(
                                fontFamily: 'Rakkas',
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                          Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color.fromRGBO(40, 230, 30, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color.fromRGBO(40, 230, 30, 1),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Rakkas',
                                      fontSize: 15),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color.fromRGBO(40, 230, 30, 1),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildCard("high", "300c", "G"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildCard("low", "400c", "B"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildCard("high", "350c", "G"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildCard("high", "280c", "G"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildCard("low", "430c", "C")
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        SelectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardTitle == selectedCard
                ? Color.fromRGBO(40, 230, 30, 1)
                : Colors.white,
            border: Border.all(
                color: cardTitle == selectedCard
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 0.75)),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cardTitle,
              style: TextStyle(
                  fontFamily: 'Rakkas',
                  fontSize: 14,
                  color:
                      cardTitle == selectedCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 12,
                      color: cardTitle == selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 12,
                      color: cardTitle == selectedCard
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SelectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
