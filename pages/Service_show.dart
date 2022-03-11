import 'package:cdms_flutter/pages/Service_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceShowPage extends StatefulWidget {
  const ServiceShowPage({Key? key}) : super(key: key);

  @override
  State<ServiceShowPage> createState() => _ServiceShowPage();
}

class _ServiceShowPage extends State<ServiceShowPage> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ServiceEditPage()),
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
              'PD Consult',
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
            onTap: () {},
            title: Text(
              'Importer',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'Importer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text('Imported Car', style: TextStyle(fontSize: 16)),
            trailing: Text('Imported car',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Arrival Date',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'arrival date',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Cut-off Date',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'cute-off date',
              style: TextStyle(fontSize: 16, color: Colors.grey),
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
            onTap: () {},
            title: Text(
              'Exporter',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'exporter',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Exported Car',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'exported car',
              style: TextStyle(fontSize: 16, color: Colors.grey),
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
            onTap: () {},
            title: Text(
              'Arrivals Location',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'Bankok',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Departure Location',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              'Bangsean',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
