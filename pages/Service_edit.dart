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
  String? selected_car_name_import;
  String? selected_car_name_export;
  String? selected_car_id_import;
  String? selected_car_id_export;
  List<String> car_id_string = [];
  List<String> car_name_string = [];

  List customer = [];
  String? selected_cus_id;
  String? selected_cus_company_name;
  List<String> cus_id_string = [];
  List<String> cus_company_name_string = [];

  List driver = [];
  String? selected_dri_id_import;
  String? selected_dri_id_export;
  String? selected_dri_name_import;
  String? selected_dri_name_export;
  List<String> dri_id_string = [];
  List<String> dri_name_string = [];

  List container = [];
  String? selected_con_id;
  String? selected_con_number;
  List<String> con_id_string = [];
  List<String> con_number_string = [];

  TextEditingController arrival_date = TextEditingController();
  TextEditingController cut_off_date = TextEditingController();
  TextEditingController current_weight = TextEditingController();
  TextEditingController arrival_location = TextEditingController();
  TextEditingController departure_location = TextEditingController();
  String testdate = '2022-03-25';

  @override
  void initState() {
    super.initState();
    _ser_id = widget.ser_id;
    getData();
  }
  
  Future<void> getContainer() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_container/get_all/4/${service['ser_con_id']}'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container = jsonDecode(result);
        for (int i = 0; i < container.length; i++) {
          con_id_string.add(container[i]['con_id']);
          con_number_string.add(container[i]['con_number']);
        }
        selected_con_id = service['ser_con_id'];
        selected_con_number = service['con_number'];
      });
    }
  }
  Future<void> getCustomer() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_customer/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        customer = jsonDecode(result);
        for (int i = 0; i < customer.length; i++) {
          cus_id_string.add(customer[i]['cus_id']);
          cus_company_name_string.add(customer[i]['cus_company_name']);
        }
        selected_cus_id = service['cus_id'];
        selected_cus_company_name = service['cus_company_name'];
      });
    }
  }

  Future<void> getDriver() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_driver/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        driver = jsonDecode(result);
        for (int i = 0; i < driver.length; i++) {
          dri_id_string.add(driver[i]['dri_id']);
          dri_name_string.add(driver[i]['dri_name']);

          if (driver[i]['dri_id'] == service['ser_dri_id_in']) {
            selected_dri_id_import = driver[i]['dri_id'];
            selected_dri_name_import = driver[i]['dri_name'];
          }
          if (driver[i]['dri_id'] == service['ser_dri_id_out']) {
            selected_dri_id_export = driver[i]['dri_id'];
            selected_dri_name_export = driver[i]['dri_name'];
          }
        }
      });
    }
  }

  Future<void> getCar() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_driver/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        car = jsonDecode(result);
        for (int i = 0; i < car.length; i++) {
          car_id_string.add(car[i]['car_id']);
          car_name_string.add('รถคันที่ ' + car[i]['car_number'] + ' ทะเบียน ' +car[i]['car_code']);

          if (car[i]['car_id'] == service['ser_car_id_in']) {
            selected_car_id_import = car[i]['car_id'];
            selected_car_name_import = car_name_string[i];
          }
          if (car[i]['car_id'] == service['ser_car_id_out']) {
            selected_car_id_export = car[i]['car_id'];
            selected_car_name_export = car_name_string[i];
          }
        }
      });
    }
  }


  Future delete() async {
    var url = Uri.http(
        '10.0.2.2:80', 'code_team4/public/Flutter_service/delete/$_ser_id');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print(jsonDecode(response.body));
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_service/get_by_id/' + _ser_id.toString()));

    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        service = jsonDecode(result);
        getCustomer();
        getContainer();
        getDriver();
        getCar();
        current_weight.text = service['ser_weight'];
        arrival_location.text = service['ser_arrivals_location'];
        departure_location.text = service['ser_departure_location'];
      });
    }
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
          Center(
            child: Text(
              'Edit service',
              style: TextStyle(fontSize: 40),
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
                        items: dri_name_string
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
                        value: selected_dri_name_import,
                        onChanged: (value) {
                          setState(() {
                            selected_dri_name_import = value as String;
                            for (int i = 0; i < dri_name_string.length; i++) {
                              if (dri_name_string[i] == selected_dri_name_import) {
                                selected_dri_id_import = dri_id_string[i];
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
                        items: car_name_string
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
                        value: selected_car_name_import,
                        onChanged: (value) {
                          setState(() {
                            selected_car_name_import = value as String;
                            for (int i = 0; i < car_name_string.length; i++) {
                              if (car_name_string[i] == selected_car_name_import) {
                                selected_car_id_import = car_id_string[i];
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
                Expanded(
                  child: DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Arrivals date',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  onChanged: (val) {
                    arrival_date.text = val.toString();
                    print(arrival_date.text);
                  },
                ),
                
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Cut-off date')),
                 Expanded(
                  child: DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Cut-off date',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  onChanged: (val) {
                    arrival_date.text = val.toString();
                  },
                ),
              )],
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
                        items: con_number_string
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
                        value: selected_con_number,
                        onChanged: (value) {
                          setState(() {
                            selected_con_number = value as String;
                            for (int i = 0; i < container.length - 1; i++) {
                              if (container[i] == selected_con_number) {
                                selected_con_id = con_id_string[i];
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
                        items: cus_company_name_string
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
                        value: selected_cus_company_name,
                        onChanged: (value) {
                          setState(() {
                            selected_cus_company_name = value as String;
                            for (int i = 0; i < customer.length; i++) {
                              if (cus_company_name_string[i] == selected_cus_company_name) {
                                selected_cus_id = cus_id_string[i];
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
                      controller: current_weight,
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
                        items: dri_name_string
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
                        value: selected_dri_name_export,
                        onChanged: (value) {
                          setState(() {
                            selected_dri_name_export = value as String;
                            for (int i = 0; i < dri_name_string.length; i++) {
                              if (dri_name_string[i] == selected_dri_name_export) {
                                selected_dri_id_export = dri_id_string[i];
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
                        items: car_name_string
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
                        value: selected_car_name_export,
                        onChanged: (value) {
                          setState(() {
                            selected_car_name_export = value as String;
                            for (int i = 0; i < car_name_string.length; i++) {
                              if (car_name_string[i] == selected_car_name_export) {
                                selected_car_id_export = car_id_string[i];
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
                      controller: arrival_location,
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
                      controller: departure_location,
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
              onPressed: () {
                print('--------------');
                print('ser_dri_id_in : $selected_dri_id_import');
                print('ser_dri_id_out : $selected_dri_id_export');
                print('ser_con_id : $selected_con_id');
                print('ser_car_id_in : $selected_car_id_import');
                print('ser_car_id_out : $selected_car_id_export');
                print('ser_arrivals_date : $testdate $date');
                print('ser_departure_date : $testdate $date');
                print('ser_id : $_ser_id');
                print('ser_weight : ${current_weight.text}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
