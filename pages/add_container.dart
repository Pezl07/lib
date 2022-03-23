import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddContainerPage extends StatefulWidget {
  @override
  _AddContainerPageState createState() => _AddContainerPageState();
}

class _AddContainerPageState extends State<AddContainerPage> {
  List container_size = [];
  List<String> size_id_string = [];
  List<String> size_name_string = [];
  List<String> size_width_string = [];
  List<String> size_length_string = [];
  List<String> size_height_string = [];
  String? showed_width_string;
  String? showed_length_string;
  String? showed_height_string;
  String? selected_size_id;
  String? selected_size_name;

  List agent = [];
  List<String> agn_id_string = [];
  List<String> agn_company_name_string = [];
  String? selected_agn_id;
  String? selected_agn_company_name;

  List container_type = [];
  List<String> cont_id_string = [];
  List<String> cont_name_string = [];
  String? selected_cont_id;
  String? selected_cont_name;

  TextEditingController con_number = TextEditingController();
  TextEditingController con_max_weight = TextEditingController();
  TextEditingController con_tare_weight = TextEditingController();
  TextEditingController con_net_weight = TextEditingController();
  TextEditingController con_cube = TextEditingController();
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    getContainerSize();
    getAgent();
    getContainerType();
  }

  Future<void> getContainerSize() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_size/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container_size = jsonDecode(result);
        for (int i = 0; i < container_size.length; i++) {
          size_id_string.add(container_size[i]['size_id']);
          size_name_string.add(container_size[i]['size_name']);
          size_width_string.add(container_size[i]['size_width_out']);
          size_length_string.add(container_size[i]['size_length_out']);
          size_height_string.add(container_size[i]['size_height_out']);
        }
      });
    }
  }

  Future<void> getAgent() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_agent/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        agent = jsonDecode(result);
        for (int i = 0; i < agent.length; i++) {
          agn_id_string.add(agent[i]['agn_id']);
          agn_company_name_string.add(agent[i]['agn_company_name']);
        }
      });
    }
  }

  Future<void> getContainerType() async{
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_container_type/get_all'));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container_type = jsonDecode(result);
        for (int i = 0; i < container_type.length; i++) {
          cont_id_string.add(container_type[i]['cont_id']);
          cont_name_string.add(container_type[i]['cont_name']);
        }
      });
    }
  }

  Future insert() async {
    var url = Uri.http('10.0.2.2:80', '/code_team4/public/Flutter_container/insert');

    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    String jsondata =
        '{"con_number":"${con_number.text}", "con_max_weight": "${con_max_weight.text}", "con_tare_weight": "${con_tare_weight.text}", "con_net_weight":"${con_net_weight.text}", "con_cube":"${con_cube.text}", "con_size_id":"$selected_size_id", "con_cont_id":"$selected_cont_id", "con_agn_id":"$selected_agn_id", "con_stac_id":"1"}';
    print(jsondata);
    var response = await http.post(url, headers: header, body: jsondata);
    print('------result-------');
    print(response.body);
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
          child: Text('CONTAINER'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
                // ถูกหมด
                print('-----------');
                print('con_number: ${con_number.text}');
                print('cont_id: $selected_cont_id');
                print('agn_id: $selected_agn_id');
                print('con_max_weight: ${con_max_weight.text}');
                print('con_tare_weight: ${con_tare_weight.text}');
                print('con_net_weight: ${con_net_weight.text}');
                print('con_cube: ${con_cube.text}');
                print('size_id: $selected_size_id');
                insert();
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
                        controller: con_number,
                        decoration: InputDecoration(
                            labelText: 'Container number',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Container(
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
                              items: cont_name_string
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
                              value: selected_cont_name,
                              onChanged: (value) {
                                setState(() {
                                  selected_cont_name = value as String;
                                  for (int i = 0; i < cont_name_string.length; i++) {
                                    if (cont_name_string[i] == selected_cont_name) {
                                        selected_cont_id = cont_id_string[i];
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
                      Container(
                          height: 40,
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Agent',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: agn_company_name_string
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
                              value: selected_agn_company_name,
                              onChanged: (value) {
                                setState(() {
                                  selected_agn_company_name = value as String;
                                  for (int i = 0; i < agn_company_name_string.length; i++) {
                                    if (agn_company_name_string[i] == selected_agn_company_name) {
                                        selected_agn_id = agn_id_string[i];
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
                        controller: con_max_weight,
                        decoration: InputDecoration(
                            labelText: 'Max weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        controller: con_tare_weight,
                        decoration: InputDecoration(
                            labelText: 'Tare weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      TextField(
                        controller: con_net_weight,
                        decoration: InputDecoration(
                            labelText: 'Net weight (t)',
                            border: OutlineInputBorder()),
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    Divider(),
                    TextField(
                        controller: con_cube,
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
                      Divider(),
                      Center(
                        child: Container(
                          height: 40,
                          width: 460,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: Text(
                                'Container size',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: size_name_string
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
                              value: selected_size_name,
                              onChanged: (value) {
                                setState(() {
                                  selected_size_name = value as String;
                                  for (int i = 0; i < size_name_string.length; i++) {
                                    if (size_name_string[i] == selected_size_name) {
                                        // ถูกหมด
                                        selected_size_id = size_id_string[i];
                                        showed_width_string = size_width_string[i];
                                        showed_length_string = size_length_string[i];
                                        showed_height_string = size_height_string[i];
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
                      Text((showed_width_string ?? "Width (m)"),
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      Text((showed_length_string ?? "Length (m)"),
                        style: TextStyle(fontSize: 14),
                      ),
                      Divider(),
                      Text((showed_height_string ?? "height (m)"),
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
