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
  }

  Future delete() async {
    var url = Uri.http('10.0.2.2:80', 'code_team4/public/Flutter_container/delete/$_con_id');
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
                Expanded(child: Text('Container')),
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
                Expanded(child: Text('Container Status')),
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
                Expanded(child: Text('Net Weight(t)')),
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
                Expanded(child: Text('Curren Weight(t)')),
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
