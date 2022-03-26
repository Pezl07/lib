import 'package:cdms_flutter/pages/Container_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
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
    getContainerType();
    getAgent();
    getContainerSize();
    getData();
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

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_container/get_by_id/' + _con_id.toString()));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container = jsonDecode(result);
        con_number.text = container['con_number'];
        con_max_weight.text = container['con_max_weight'];
        con_tare_weight.text = container['con_tare_weight'];
        con_net_weight.text = container['con_net_weight'];
        con_cube.text = container['con_cube'];
        selected_cont_id = container['cont_id'];
        selected_cont_name = container['cont_name'];
        selected_agn_id = container['con_agn_id'];
        selected_agn_company_name = container['agn_company_name'];

        selected_size_id = container['size_id'];
        selected_size_name = container['size_name'];

        showed_width_string = container['size_width_out'];
        showed_length_string = container['size_length_out'];
        showed_height_string = container['size_height_out'];
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

  Future update() async {
    var url = Uri.http('10.0.2.2:80', '/code_team4/public/Flutter_container/update');

    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    String jsondata =
        '{"con_id":"$_con_id","con_number":"${con_number.text}", "con_max_weight": "${con_max_weight.text}", "con_tare_weight": "${con_tare_weight.text}", "con_net_weight":"${con_net_weight.text}", "con_cube":"${con_cube.text}", "con_size_id":"$selected_size_id", "con_cont_id":"$selected_cont_id", "con_agn_id":"$selected_agn_id", "con_stac_id":"4"}';
    print(jsondata);
    var response = await http.put(url, headers: header, body: jsondata);
    print('------result-------');
    print(response.body);
  }

  Future<String> delete() async {
    var url = Uri.http(
        '10.0.2.2:80', 'code_team4/public/Flutter_container/delete/$_con_id');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    return jsonDecode(response.body);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cannot delete the container'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('The container is used by some service'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {int count = 0; Navigator.of(context).popUntil((_)=> count++>= 1);},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('CONTAINER'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () async {
                var status = await delete();
                if (status == 'success') {
                  int count = 0;
                  delete().then((value) => Navigator.of(context).popUntil((_)=> count++>= 2));
                } else {
                  _showMyDialog();
                }
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
              'Edit container',
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
                    controller: con_number,
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
                      controller: con_max_weight,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
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
                      controller: con_tare_weight,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                    ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Net Weight(t)')),
                Expanded(
                  child: TextField(
                      controller: con_net_weight,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
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
                      controller: con_cube,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
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
                Expanded(child: Text('Width (m)')),
                Expanded(
                  child: Text('$showed_width_string'),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: <Widget>[
                Expanded(child: Text('Length (m)')),
                Expanded(
                  child: Text('$showed_length_string'),
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
                  child: Text('$showed_height_string'),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                // ถูกหมด
                // print('-----------');
                // print('con_number: ${con_number.text}');
                // print('cont_id: $selected_cont_id');
                // print('agn_id: $selected_agn_id');
                // print('con_max_weight: ${con_max_weight.text}');
                // print('con_tare_weight: ${con_tare_weight.text}');
                // print('con_net_weight: ${con_net_weight.text}');
                // print('con_cube: ${con_cube.text}');
                // print('size_id: $selected_size_id');

                update().then((value) => Navigator.pop(context));
              },
            ),
          ),
        ],
      ),
    );
  }
}
