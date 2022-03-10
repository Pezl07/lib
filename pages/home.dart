import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text("Halloween Knowledge")
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
              // var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return myBox(
                    snapshot.data[index]['title'], snapshot.data[index]['sub_title'], 
                    snapshot.data[index]['image_url'], snapshot.data[index]['detail']
                    );
                },
                itemCount: snapshot.data.length,
                );
            },
            future: getData(),
            // future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          )
        )
    );
  }

  Widget myBox(String title, String sub_title, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title; 
    v2 = sub_title; 
    v3 = image_url;
    v4 = detail;
    
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      // color: Colors.blue,
      
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit:BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20
            ),
          ),
          SizedBox(height: 10),
          Text(
              sub_title,
              style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
          SizedBox(height: 15),
          TextButton(onPressed: (){
            print("Next Page >>>");
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(v1, v2, v3, v4)));
          }, child: Text("Next Page >>>"),)
        ],
      )
    );
  }

}

Future getData () async {
  //https://raw.githubusercontent.com/Pezl07/BasicAPI/main/data2.json
  var url =Uri.https('raw.githubusercontent.com', '/Pezl07/BasicAPI/main/data2.json');
  
  //นำข้อมูล JSON จาก BackEnd
  // var url = Uri.http('e53b-1-46-10-119.ngrok.io','/');
  var response = await http.get(url);
  var result = json.decode(response.body);
  return result;
}