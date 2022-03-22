import 'package:cdms_flutter/main.dart';
import 'package:cdms_flutter/pages/Container_edit.dart';
import 'package:cdms_flutter/pages/Container_showlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerShowPage extends StatefulWidget {
  const ContainerShowPage({Key? key}) : super(key: key);

  @override
  State<ContainerShowPage> createState() => _ContainerShowPage();
}

class _ContainerShowPage extends State<ContainerShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('CONTAINER'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerEditPage()),
                );
              },
              icon: Icon(
                Icons.create_rounded,
                color: Colors.white,
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
