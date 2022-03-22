import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

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

String? selectedValue_select;
List<String> items_select = [
  'Open-top',
  'ISO Tank',
  'Reefer Container',
  'Dry Container',
];

String? selectedValue_agent;
List<String> items_agent = [
  'PD Consult',
  'คิวคิว โลจิสต์',
  'ไอวีซอฟต์',
];

String? selectedValue_export;
List<String> items_export = [
  'วิรัตน์ สากร',
  'ธนาธิป บุญเนตร',
  'ชุติพนต์ เติมสิริสุขสิน',
  'บารมี ชมชื่น',
];

String? selectedValue_export_car;
List<String> items_export_car = [
  'คันที่ 1 ทะเบียน กอ 342',
  'คันที่ 2 ทะเบียน กอ 345',
  'คันที่ 3 ทะเบียน กอ 442',
  'คันที่ 4 ทะเบียน กอ 355',
];

class AddServicePage extends StatefulWidget {
  //const AddServicePage({ Key? key }) : super(key: key);

  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
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
                          width: 460,
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
                          width: 460,
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
                        dateLabelText: 'Arrival date',
                        style: TextStyle(
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
                        dateLabelText: 'Cut-off date',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        onChanged: (val) {
                          print(val.toString());
                        },
                      ),
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Container type',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items_select
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
                              value: selectedValue_select,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue_select = value as String;
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
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Select agent',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items_agent
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
                              value: selectedValue_agent,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue_agent = value as String;
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Current Weight',
                          
                        ),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
keyboardType: TextInputType.number,
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                //Export
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Export', style: _headerStyle),
                  content: Column(
                    children: [
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Exporter',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items_export
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
                              value: selectedValue_export,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue_export = value as String;
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
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Exporter car',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items_export_car
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
                              value: selectedValue_export_car,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue_export_car = value as String;
                                });
                              },
                              buttonHeight: 40,
                              buttonWidth: 140,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Location
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
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Departure location',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
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
