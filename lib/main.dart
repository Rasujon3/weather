import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:core';

void main() async {

  Map data = await getAllData();
  //print("Result is:"+data['city']['coord']["lat"].toString());

  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Weather"),
          backgroundColor: Colors.deepOrange,
        ),
        body: new Container(
          height: 800.0,
          child: new Stack(
            children: [
              new Container(
                height: 800.0,
                child: new Image(image: AssetImage("asset/sun.jpg"),
                fit: BoxFit.cover,
                ),
              ),
              new Positioned(
                  bottom: 50.0,
                child: new Container(
                  height: 250.0,
                  margin: EdgeInsets.all(10.0),
                  width: 450.0,
                  color: Colors.deepOrange,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text("Temperature : "+data['list'][0]['main']['temp'].toString()+"/F",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      ),
                      new SizedBox(height: 10.0,),
                      Text("Weather : "+data['list'][0]['weather'][0]['main'],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      new SizedBox(height: 10.0,),
                      Text("City : "+data['city']["name"],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    ),
  );
}

Future<Map> getAllData() async{
  var api = "https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=075b6fd1c138103dce75d3793e35893e";
  var data =await http.get(api);
  var jsonData = json.decode(data.body);
  return jsonData;
}
