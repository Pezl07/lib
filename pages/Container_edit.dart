import 'package:cdms_flutter/pages/Container_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ContainerEditPage extends StatefulWidget {
  final con_id;
  const ContainerEditPage(this.con_id);

  @override
  State<ContainerEditPage> createState() => _ContainerEditPage();
}

class _ContainerEditPage extends State<ContainerEditPage> {
  var _con_id;
  var container = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _con_id = widget.con_id;
    print('con edit page' + _con_id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ContainerShowPage(1)),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('CONTAINER'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  // ContainerEditPage();
                });
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
            onTap: () {},
            title: Text(
              'Container',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              '51822 0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text('Container Status', style: TextStyle(fontSize: 16)),
            trailing: Text('Status',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
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
            onTap: () {},
            title: Text(
              'Max weight(t)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'weight(t)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Net weight(t)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'weight(t)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              'Current weight(t)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'weight(t)',
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
              'Cube (CBM)',
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
              style: TextStyle(fontSize: 20, color: Colors.grey),
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
              'size',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Width(m)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'width(m)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Length(m)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'length(m)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Height(m)',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'height(m)',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
