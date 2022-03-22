import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddContainerPage extends StatefulWidget {
  //const AddContainerPage({ Key? key }) : super(key: key);

  @override
  _AddContainerPageState createState() => _AddContainerPageState();
}

class _AddContainerPageState extends State<AddContainerPage> {
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
          child: Text('CONTAINER'),
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
          //Container information
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
                    'Container information',
                    style: _headerStyle,
                  ),

                  content: Column(
                    children: [
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Container number',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Container status',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                //Weight
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Weight', style: _headerStyle),
                  content: Column(
                    children: [
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Max weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Tare weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Net weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Cube (CBM)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                //Size
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Size', style: _headerStyle),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Container size',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Width (m)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Length (m)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Height (m)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
