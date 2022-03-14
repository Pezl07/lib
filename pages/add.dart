import 'package:accordion/accordion.dart';
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
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);

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
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              'SAVE',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
      ),
      body: ListView(
        children: [
          //Import
          Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black54,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
              children: [
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Import', style: _headerStyle ,),
                  
                  content: Column(
                    children: [
                      Divider(),
                      Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Import',
                                border: OutlineInputBorder()),
                            // textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          // ],
                          // ),
                          // Row(
                          // children: [
                          // Text('test'
                          //   // decoration: new InputDecoration(
                          //   //     border: InputBorder.none,
                          //   //     focusedBorder: InputBorder.none,
                          //   //     contentPadding: EdgeInsets.only(
                          //   //         left: 15, bottom: 11, top: 11, right: 15),
                          //   //     hintText: 'Subject'),
                          //   // textAlign: TextAlign.center,
                          //   // style: TextStyle(fontSize: 18, color: Colors.grey),
                          // ),
                        ],
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Imported car',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Arrival data',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Cut-off date',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ]),
          //Export
          Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black54,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
              children: [
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Export', style: _headerStyle),
                  content: Column(
                    children: [
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Exporter',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Exported car',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ]),
          //Location
          Accordion(
              maxOpenSections: 1,
              headerBackgroundColorOpened: Colors.black54,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
              children: [
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Location', style: _headerStyle),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Arrivals location',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Departure location',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
