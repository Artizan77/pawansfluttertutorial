import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(
              'load_json/person.json',
            ),
            builder: (context, snapshot) {
              //Decode Json
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Name: " + mydata[index]['name'],
                        ),
                        Text(
                          "Age: " + mydata[index]['age'],
                        ),
                        Text(
                          "Height: " + mydata[index]['height'],
                        ),
                        Text(
                          "Gender: " + mydata[index]['gender'],
                        ),
                        Text(
                          "Hair Color: " + mydata[index]['hair_color'],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
