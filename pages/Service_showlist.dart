import 'package:cdms_flutter/pages/Service_show.dart';
import 'package:cdms_flutter/pages/add_service.dart';
import 'package:flutter/material.dart';

class ServiceShowListPage extends StatefulWidget {
  const ServiceShowListPage({Key? key}) : super(key: key);

  @override
  State<ServiceShowListPage> createState() => _ServiceShowListPageState();
}

class _ServiceShowListPageState extends State<ServiceShowListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('SERVICE'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServiceShowPage())).then((value) {
              });
            },
            title: Text(
              'Service 1',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            subtitle: Text(
              'PD Consult',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            trailing: Text(
              '6 Jan 2022',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ServiceShowPage())).then((value) {
              });
            },
            title: Text('Service 2',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            subtitle: Text('At Pro Solution',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            trailing: Text('7 Jan 2022',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          const Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddServicePage())).then((value) {
          });
        },
      ),
    );
  }
  
}
