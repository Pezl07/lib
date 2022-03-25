import 'package:flutter/material.dart';
import 'package:cdms_flutter/pages/Container_showlist.dart';
import 'package:cdms_flutter/pages/Service_showlist.dart';
import 'package:cdms_flutter/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController user_username

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
        title: Text('CDMS'),
        backgroundColor: Color.fromARGB(255, 1, 0, 73),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Account Login'),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password'),
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage()
                        )
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}