import 'package:cdms_flutter/pages/Service_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ServiceEditPage extends StatefulWidget {
  final ser_id;
  const ServiceEditPage(this.ser_id);

  @override
  State<ServiceEditPage> createState() => _ServiceEditPage();
}

class _ServiceEditPage extends State<ServiceEditPage> {
  String? date = DateFormat('kk:mm:ss').format(DateTime.now());

  var _ser_id;
  var service = <String, dynamic>{};

  List car = [];
  String? selected_car_import;
  String? selected_car_export;
  String? selected_car_id_import;
  String? selected_car_id_export;
  List<String> car_id = [];
  List<String> items_car = [];

  List customer = [];
  String? selected_customer;
  String? selected_customer_id;
  List<String> customer_id = [];
  List<String> items_customer = [];

  List driver = [];
  String? selected_dri_import;
  String? selected_dri_export;
  String? selected_dri_id_import;
  String? selected_dri_id_export;
  List<String> dri_id = [];
  List<String> items_dri = [];

  List container = [];
  String? selected_container;
  String? selected_container_id;
  List<String> container_id = [];
  List<String> items_container = [];

  TextEditingController arrival_date = TextEditingController();
  TextEditingController cut_off_date = TextEditingController();
  TextEditingController current_weight = TextEditingController();
  TextEditingController arrival_location = TextEditingController();
  TextEditingController departure_location = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ser_id = widget.ser_id;
  }
  
  Future delete() async {
    var url = Uri.http(
        '10.0.2.2:80', 'code_team4/public/Flutter_service/delete/$_ser_id');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print(jsonDecode(response.body));
  }

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
                delete().then((value) => Navigator.of(context).popUntil((route) => route.isFirst)); 
              },
              icon: Icon(
                Icons.auto_delete,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {},
            title: Text(
              'Service Name',
              style: TextStyle(fontSize: 30),
            ),
            trailing: Text(
              'PD Consult',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'IMPORT',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Import')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Import',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_dri
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
                        value: selected_dri_import,
                        onChanged: (value) {
                          setState(() {
                            selected_dri_import = value as String;
                            for (int i = 0; i < items_dri.length; i++) {
                              if (items_dri[i] == selected_dri_import) {
                                selected_dri_id_import = dri_id[i];
                                break;
                              }
                            }
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
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Imported Car')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Imported car',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_car
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
                        value: selected_car_import,
                        onChanged: (value) {
                          setState(() {
                            selected_car_import = value as String;
                            for (int i = 0; i < items_car.length; i++) {
                              if (items_car[i] == selected_car_import) {
                                selected_car_id_import = car_id[i];
                                break;
                              }
                            }
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
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Arrival Date')),
                //โค้ดวันที่แต่ใส่แล้วเหมือนจะไม่ได้ครับ
                // DateTimePicker(
                //         initialValue: '',
                //         firstDate: DateTime(2000),
                //         lastDate: DateTime(2100),
                //         dateLabelText: 'Arrival date',
                //         style: TextStyle(
                //           fontSize: 14,
                //         ),
                //         onChanged: (val) {
                //           arrival_date.text = val.toString();
                //         },
                //       ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Cut-off Date')),
                 //โค้ดวันที่แต่ใส่แล้วเหมือนจะไม่ได้ครับ
                // DateTimePicker(
                //   initialValue: '',
                //   firstDate: DateTime(2000),
                //   lastDate: DateTime(2100),
                //   dateLabelText: 'Cut-off date',
                //   style: TextStyle(
                //     fontSize: 14,
                //   ),
                //   onChanged: (val) {
                //     cut_off_date.text = val.toString();
                //   },
                // ),
              ],
            ),
          ),

          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Container')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Container',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_container
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
                        value: selected_container,
                        onChanged: (value) {
                          setState(() {
                            selected_container = value as String;
                            for (int i = 0; i < items_container.length; i++) {
                              if (items_container[i] == selected_container) {
                                selected_container_id = container_id[i];
                                break;
                              }
                            }
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

          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Customer')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Customer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_customer
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
                        value: selected_customer,
                        onChanged: (value) {
                          setState(() {
                            selected_customer = value as String;
                            for (int i = 0; i < items_customer.length; i++) {
                              if (items_customer[i] == selected_customer) {
                                selected_customer_id = customer_id[i];
                                break;
                              }
                            }
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

          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Current weight')),
                Expanded(
                  child: TextField(
                      // your TextField's Content
                      ),
                ),
              ],
            ),
          ),

          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'EXPORT',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Exporter')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Exporter',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_dri
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
                        value: selected_dri_export,
                        onChanged: (value) {
                          setState(() {
                            selected_dri_export = value as String;
                            for (int i = 0; i < items_dri.length; i++) {
                              if (items_dri[i] == selected_dri_export) {
                                selected_dri_id_export = dri_id[i];
                                break;
                              }
                            }
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
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Exported Car')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Exporter car',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items_car
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
                        value: selected_car_export,
                        onChanged: (value) {
                          setState(() {
                            selected_car_export = value as String;
                            for (int i = 0; i < items_car.length; i++) {
                              if (items_car[i] == selected_car_export) {
                                selected_car_id_export = car_id[i];
                                break;
                              }
                            }
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
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'LOCATION',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Arrivals Location')),
                Expanded(
                  child: TextField(
                      // your TextField's Content
                      ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Departure Location')),
                Expanded(
                  child: TextField(
                      // your TextField's Content
                      ),
                ),
              ],
            ),
          ),
          // const Divider(),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
