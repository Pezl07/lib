import 'package:cdms_flutter/pages/Container_show.dart';
import 'package:cdms_flutter/pages/add_container.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContainerShowListPage extends StatefulWidget {
  const ContainerShowListPage({Key? key}) : super(key: key);

  @override
  State<ContainerShowListPage> createState() => _ContainerShowListPageState();
}

class _ContainerShowListPageState extends State<ContainerShowListPage> {
  List container = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_container/get_all'));
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
          icon: const Icon(Icons.business, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('CONTAINER'),
        backgroundColor: const Color.fromARGB(255, 25, 24, 29),
      ),
      body: ListView.builder(
        itemCount: container.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const FlutterLogo(),
              title: Text('${container[index]['con_number']}',
              style: const TextStyle(fontSize: 20, color: Colors.black)),
              subtitle: Text('${container[index]['cont_name']}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContainerShowPage(
                    container[index]['con_id']
                  ))).then((value) {
              });
            },
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
