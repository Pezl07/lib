import 'package:cdms_flutter/pages/Service_show.dart';
import 'package:cdms_flutter/pages/add_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class ServiceShowListPage extends StatefulWidget {
  const ServiceShowListPage({Key? key}) : super(key: key);

  @override
  State<ServiceShowListPage> createState() => _ServiceShowListPageState();
}

class _ServiceShowListPageState extends State<ServiceShowListPage> {
  List service = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url =
        Uri.http('10.0.2.2:80', '/code_team4/public/Flutter_service/get_all');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        service = jsonDecode(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.05), BlendMode.dstATop),
          image: NetworkImage(
              'https://raw.githubusercontent.com/wirat0155/code_team4/New-UI/public/upload/BCDMS_Logo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          title: Text('SERVICE'),
          backgroundColor: Color.fromARGB(255, 1, 0, 73),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await getData();
              },
              child: new Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: service.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/photos/stack-of-containers-cargo-ship-importexport-in-harbor-port-cargo-of-picture-id1269639971?k=20&m=1269639971&s=612x612&w=0&h=L0vKXCYE-v-48_gnWgRgSFPipGOth7TGItDZek2K39Y=')),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${service[index]['con_number']}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black)),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('${service[index]['stac_name']}'),
                      ))
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          service[index]['cus_branch'] == null
                              ? '${service[index]['cus_company_name']}'
                              : '${service[index]['cus_company_name']} ${service[index]['cus_branch']}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey)),
                      Text(service[index]["ser_departure_date"]
                                  .substring(0, 1) ==
                              '2'
                          ? '${service[index]["ser_departure_date"].substring(0, 10)}'
                          : 'ยังไม่มีกำหนด'),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ServiceShowPage(service[index]['ser_id'])))
                        .then((value) async {
                      await getData();
                    });
                  },
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddServicePage()))
                .then((value) async {
              await getData();
            });
          },
        ),
      ),
    );
  }
}
