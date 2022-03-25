import 'package:cdms_flutter/pages/Service_edit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class ServiceShowPage extends StatefulWidget {
  final ser_id;
  const ServiceShowPage(this.ser_id);

  @override
  State<ServiceShowPage> createState() => _ServiceShowPage();
}

class _ServiceShowPage extends State<ServiceShowPage> {
  var _ser_id;
  var _dri_in = <String, dynamic>{};
  var _dri_out = <String, dynamic>{};
  var _car_in = <String, dynamic>{};
  var _car_out = <String, dynamic>{};
  var service = <String, dynamic>{};
  String? ser_arrivals_date;
  String? ser_departure_date;

  @override
  void initState() {
    super.initState();
    _ser_id = widget.ser_id;
    getData();
  }

  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_service/get_by_id/' + _ser_id.toString()));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      
      setState(() {
        service = jsonDecode(result);
        ser_arrivals_date = service['ser_arrivals_date'].substring(0, 10);
        ser_departure_date = service['ser_departure_date'].substring(0, 10);
        getDriver(service['ser_dri_id_in'], 'in');
        getDriver(service['ser_dri_id_out'], 'out');
        getCar(service['ser_car_id_in'], 'in');
        getCar(service['ser_car_id_out'], 'out');
      });
    }
  }

  Future getDriver(dri_id, choice) async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_driver/get_by_id/' + dri_id.toString()));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        if (choice == 'in') {
          _dri_in = jsonDecode(result);
        } else {
          _dri_out = jsonDecode(result);
        }
      });
    }
  }

  Future getCar(car_id, choice) async {
    final response = await http.get(Uri.parse('http://10.0.2.2/code_team4/public/Flutter_car/get_by_id/' + car_id.toString()));
    if (response.statusCode == 200) {
      var result = utf8.decode(response.bodyBytes);
      setState(() {
        if (choice == 'in') {
          _car_in = jsonDecode(result);
        } else {
          _car_out = jsonDecode(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {int count = 0; Navigator.of(context).popUntil((_)=> count++>= 1);},
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
                      builder: (context) => ServiceEditPage(_ser_id, ser_arrivals_date, ser_departure_date))).then((value) async {
                    await getData();
              });
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
              service['con_number'].toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text('Container type', style: TextStyle(fontSize: 16)),
            trailing: Text('${service['cont_name']}',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          ListTile(
            onTap: () {},
            title: Text('Customer', style: TextStyle(fontSize: 16)),
            trailing: Text(service['cus_branch'] == null ? '${service['cus_company_name']}' : '${service['cus_company_name']} ${service['cus_branch']}',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
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
            title: Text('Importer',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              '${_dri_in['dri_name']}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text('Imported Car', style: TextStyle(fontSize: 16)),
            trailing: Text('${_car_in['car_code']}',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),
          const Divider(),
          ListTile(
            onTap: () {},
            title: Text(
              'Arrival Date',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text('${service['ser_arrivals_date']}',
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
              '${service['ser_departure_date']}',
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
            trailing: Text('${_dri_out['dri_name']}',
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
            trailing: Text('${_car_out['car_code']}',
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
            trailing: Text('${service['ser_arrivals_location']}',
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
              '${service['ser_departure_location']}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
