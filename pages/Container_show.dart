import 'package:cdms_flutter/main.dart';
import 'package:cdms_flutter/pages/Container_edit.dart';
import 'package:cdms_flutter/pages/Container_showlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ContainerShowPage extends StatefulWidget {
  final con_id;
  const ContainerShowPage(this.con_id);

  @override
  State<ContainerShowPage> createState() => _ContainerShowPage();
}

class _ContainerShowPage extends State<ContainerShowPage> {
  var _con_id;
  var container = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _con_id = widget.con_id;
    getData();
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse(
        'http://10.0.2.2/code_team4/public/Flutter_container/get_by_id/' +
            _con_id.toString()));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        container = jsonDecode(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 1);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(container['con_number'].toString()),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContainerEditPage(_con_id)))
                    .then((value) async {
                  await getData();
                });
              },
              icon: Icon(
                Icons.create_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Center(
              child: Text(
                container['con_number'].toString(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(height: 30),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'CONTAINER INFORMATION',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'Container',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['con_number'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text('Container Type', style: TextStyle(fontSize: 16)),
              trailing: Text(container['cont_name'].toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'WEIGHT',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'Max weight (t)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['con_max_weight'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Tare weight (t)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['con_tare_weight'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Net weight (t)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['con_net_weight'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Cube (CBM)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['con_cube'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'SIZE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text(
                'Container Size',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['size_name'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Width (m)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['size_width_out'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Length (m)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['size_length_out'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text(
                'Height (m)',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                container['size_height_out'].toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
