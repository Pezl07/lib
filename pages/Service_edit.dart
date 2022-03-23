import 'package:cdms_flutter/pages/Service_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceEditPage extends StatefulWidget {
  const ServiceEditPage({Key? key}) : super(key: key);

  @override
  State<ServiceEditPage> createState() => _ServiceEditPage();
}

class _ServiceEditPage extends State<ServiceEditPage> {
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
                setState(() {
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
                Expanded(child: Text('Imported Car')),
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
                Expanded(child: Text('Arrival Date')),
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
                Expanded(child: Text('Cut-off Date')),
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
                Expanded(child: Text('Exported Car')),
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
