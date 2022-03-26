import 'package:flutter/material.dart';
import 'package:cdms_flutter/main_page.dart';
import 'package:cdms_flutter/pages/Service_showlist.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  TextEditingController user_username = TextEditingController();
  TextEditingController user_password = TextEditingController();

  @override
  Future<String> login() async {
    var url = Uri.http('10.0.2.2:80', '/code_team4/public/Flutter_login/login');

    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    String jsondata = '{"user_username":"${user_username.text}", "user_password":"${user_password.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://www.itl.cat/pngfile/big/38-384974_blue-abstract-wallpaper-iphone-6-iphone-wallpaper-blue.jpg'), fit: BoxFit.cover,),
              ),
      child : Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100),
                    Container(
                      child: Image.network('https://raw.githubusercontent.com/wirat0155/code_team4/New-UI/public/upload/WCDMS.png', height: 60,),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: user_username,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2
                          )
                      ),
                      labelText: 'Username'),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: user_password,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2
                          )),
                        labelText: 'Password'),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async {
                        String login_status = await login();
                        if (login_status == 'success') {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const MainPage()
                            )
                          );
                        } else {
                          const snackBar = SnackBar(content: Text('Login failed, wrong username or password'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 1, 0, 73)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    ));
  }
}