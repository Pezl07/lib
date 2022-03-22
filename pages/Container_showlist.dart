import 'package:cdms_flutter/pages/Container_show.dart';
import 'package:cdms_flutter/pages/add_container.dart';
import 'package:flutter/material.dart';

class ContainerShowListPage extends StatefulWidget {
  const ContainerShowListPage({Key? key}) : super(key: key);

  @override
  State<ContainerShowListPage> createState() => _ContainerShowListPageState();
}

class _ContainerShowListPageState extends State<ContainerShowListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.business, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('CONTAINER'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContainerShowPage())).then((value) {
              });
            },
            title: Text(
              'WFHU 51822 0',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            subtitle: Text(
              'Dry Container',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContainerShowPage())).then((value) {
              });
            },
            title: Text('ONES 67834 0',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            subtitle: Text('Reefer Container',
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
                  builder: (context) => AddContainerPage())).then((value) {
          });
        },
      ),
    );
  }
}
