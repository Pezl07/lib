import 'package:flutter/material.dart';
// import 'package:layout/pages/detail.dart';
// import 'package:layout/pages/home.dart';

class ShowlistPage extends StatefulWidget {
  const ShowlistPage({Key? key}) : super(key: key);

  @override
  State<ShowlistPage> createState() => _ShowlistPageState();
}

class _ShowlistPageState extends State<ShowlistPage> {
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
            onTap: () {},
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
            onTap: () {},
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
        onPressed: () {},
      ),
    );
  }
}
