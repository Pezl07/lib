import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddPage extends StatefulWidget {
  //const AddPage({ Key? key }) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          
          child: Text('SERVICE'),
        ),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
      ),
      body: ListView(
        children: [
          Divider(
            color: (Colors.black),
          ),
          Row(
            children: [
              Text(
                'Import',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'Importer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Importer',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                'Imported car',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Imported car',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                'Arrival data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Arrival data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                'Cut-off data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Cut-off data',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'Export',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'Exporter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Exporter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                'Exported car',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Exported car',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'Location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'Arrivals location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Arrivals location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                'Departure location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Departure location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
