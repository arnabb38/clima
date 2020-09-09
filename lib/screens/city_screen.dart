import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/world.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0, left: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                            iconSize: 30.0,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.info),
                        iconSize: 30.0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text('DEVELOPED BY\n\n'),
                                content: Text(
                                  'Arnab Basak\nSoftware Developer\nlinkedin.com/in/arnab-basak\n\n\nAll rights reserved.',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // textAlign: TextAlign.left,
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text("THANKS"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        // Icon(
                        //   Icons.location_city,
                        //   size: 50.0,
                        //   color: Colors.white,
                        // ),
                        Image(
                          image: AssetImage("images/search.png"),
                          height: 150.0,
                          width: 150.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: kDecorationTextStyle,
                          onChanged: (value) {
                            //print(value);
                            cityname = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (cityname != null) {
                            if (cityname.length > 1) {
                              Navigator.pop(context, cityname);
                            }
                          }
                        },
                        icon: Icon(
                          Icons.location_searching,
                        ),
                        iconSize: 40.0,
                      ),
                      Text(
                        "Get Weather",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Data provided in part by",
                      textAlign: TextAlign.center,
                      style: kCreditsTag,
                    ),
                    Text(
                      "  OpenWeather",
                      textAlign: TextAlign.center,
                      style: kCreditsName,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Images provided in part by",
                      textAlign: TextAlign.center,
                      style: kCreditsTag,
                    ),
                    Text(
                      "  Unsplash",
                      textAlign: TextAlign.center,
                      style: kCreditsName,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
