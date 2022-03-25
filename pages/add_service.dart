import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddServicePage extends StatefulWidget {
  //const AddServicePage({ Key? key }) : super(key: key);

  @override
  _AddServicePageState createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {

  String? date = DateFormat('kk:mm:ss').format(DateTime.now());
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

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    getContainer();
    getCustomer();
    getDriver();
    getCar();
  }

  Future<void> getDriver() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_driver/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        driver = jsonDecode(result);
        for (int i = 0; i < driver.length; i++) {
          dri_id.add(driver[i]['dri_id']);
          items_dri.add(driver[i]['dri_name']);
        }
      });
    }
  }

  Future<void> getCar() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_car/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        car = jsonDecode(result);
        for (int i = 0; i < car.length; i++) {
          car_id.add(car[i]['car_id']);
          items_car.add('รถคันที่ ' + car[i]['car_number'] + ' ทะเบียน ' +car[i]['car_code']);
        }
      });
    }
  }

  Future<void> getContainer() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_container/get_all/3'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container = jsonDecode(result);
        for (int i = 0; i < container.length; i++) {
          container_id.add(container[i]['con_id']);
          items_container.add(container[i]['con_number']);
        }
      });
    }
  }

  Future<void> getCustomer() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_customer/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        customer = jsonDecode(result);
        print(customer);
        for (int i = 0; i < customer.length; i++) {
          customer_id.add(customer[i]['cus_id']);
          items_customer.add(customer[i]['cus_company_name']);
        }
      });
    }
  }

  Future insert() async {
    var url = Uri.http('10.0.2.2:80', '/code_team4/public/Flutter_service/insert');

    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    String jsondata =
        '{"ser_departure_date":"${cut_off_date.text} ${date}", "ser_car_id_in": "$selected_car_id_import", "ser_arrivals_date": "${arrival_date.text} ${date}", "ser_dri_id_in":"$selected_dri_id_import", "ser_dri_id_out":"$selected_dri_id_export", "ser_car_id_out":"$selected_car_id_export", "ser_arrivals_location":"${arrival_location.text}", "ser_departure_location":"${departure_location.text}", "ser_weight":"${current_weight.text}", "ser_con_id": "$selected_container_id", "ser_stac_id": "1", "ser_cus_id": "$selected_customer_id" }';
    // print(jsondata);
    var response = await http.post(url, headers: header, body: jsondata);
    // print('------result-------');
    // print(response.body);
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
        title: Center(
          child: Text('SERVICE'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              insert().then((value) =>  Navigator.pop(context));
            },
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
                          arrival_date.text = val.toString();
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
                          cut_off_date.text = val.toString();
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
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 460,
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
                      Divider(),
                      TextField(
                        controller: current_weight,
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
                //Location
                AccordionSection(
                  isOpen: false,
                  // leftIcon: const Icon(Icons.computer, color: Colors.white),
                  header: Text('Location', style: _headerStyle),
                  content: Column(
                    children: [
                      TextField(
                        controller: arrival_location,
                        decoration: InputDecoration(
                            labelText: 'Arrivals location',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        controller: departure_location,
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
