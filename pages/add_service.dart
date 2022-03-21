import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_time_picker/date_time_picker.dart';

String? selectedValue;
List<String> items = [
  'รถคันที่ 1 ทะเบียน กอ 111',
  'รถคันที่ 2 ทะเบียน กช 222',
  'รถคันที่ 3 ทะเบียน กข 333',
  'รถคันที่ 4 ทะเบียน ตอ 444',
];

String? selectedValue_import;
List<String> items_import = [
  'นายสมรัก อยู่เย็น',
  'นายสมดี อยู่เย็น',
  'นายสมชาย อยู่เย็น',
  'นายสมหมาย อยู่เย็น',
];


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
                  header: Text(
                    'Import',
                    style: _headerStyle,
                  ),

                  content: Column(
                    children: [
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 350,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Import',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items_import
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue_import,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue_import = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 350,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Imported car',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ),
                      Divider(),




                      
                    DateTimePicker(
              initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Arrival date',style: TextStyle(
                                  fontSize: 14,
                                ),
              onChanged: (val) {
                print(val.toString());
  
              },
            ),
                
                
                
            
                      Divider(),
                           
                    DateTimePicker(
              initialValue: '',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Cut-off date',style: TextStyle(
                                  fontSize: 14,
                                ),
              onChanged: (val) {
                print(val.toString());
  
              },
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