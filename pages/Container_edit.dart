import 'package:cdms_flutter/pages/Container_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';

class ContainerEditPage extends StatefulWidget {
  final con_id;
  const ContainerEditPage(this.con_id);

  @override
  State<ContainerEditPage> createState() => _ContainerEditPage();
}

class _ContainerEditPage extends State<ContainerEditPage> {
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

  var _con_id;
  var container = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _con_id = widget.con_id;
  }

  Future delete() async {
    var url = Uri.http(
        '10.0.2.2:80', 'code_team4/public/Flutter_container/delete/$_con_id');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
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
        title: Text('CONTAINER'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () {
                delete();
                Navigator.of(context).popUntil((route) => route.isFirst);
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
              'WFHU 51822 0',
              style: TextStyle(fontSize: 40),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'CONTAINER INFORMATION',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Container number')),
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
                Expanded(child: Text('Container type')),
                Container(
                  height: 40,
                  width: 190,
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
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Agent')),
                Container(
                  height: 40,
                  width: 190,
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
                          for (int i = 0;
                              i < agn_company_name_string.length;
                              i++) {
                            if (agn_company_name_string[i] ==
                                selected_agn_company_name) {
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
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'WEIGHT',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Max Weight(t)')),
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
                Expanded(child: Text('Tare Weight(t)')),
                Expanded(
                  child: TextField(
                      // your TextField's Content
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Net Weight(t)')),
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
                Expanded(child: Text('Cube (CBM)')),
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
              'SIZE',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Container Size')),
                Center(
                  child: Container(
                    height: 40,
                    width: 190,
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
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Width(m)')),
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
                Expanded(child: Text('Lenght(m)')),
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
                Expanded(child: Text('Height(m)')),
                Expanded(
                  child: TextField(
                      // your TextField's Content
                      ),
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
