import 'package:cdms_flutter/pages/Service_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceShowPage extends StatefulWidget {
  const ServiceShowPage({Key? key}) : super(key: key);

  @override
  State<ServiceShowPage> createState() => _ServiceShowPage();
}

class _ServiceShowPage extends State<ServiceShowPage> {
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
        title: Text('SERVICE'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceEditPage()),
                );
              },
              icon: Icon(
                Icons.create_rounded,
                color: Colors.yellow,
              ))
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PD Consult',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'IMPORT',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
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
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'EXPORT',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
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
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                'LOCATION',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
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
          Divider(),
        ],
      ),
    );
  }
}
