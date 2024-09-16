import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab_5/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State {
  TextEditingController _usename = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();

  void _onRegiste() {
    http.post(Uri.parse("${Config.apiUrl}/user-register"), body: {
      'userName': _usename.text,
      'password': _password.text,
      'firstName': _firstname.text,
      'lastName': _lastname.text,
    }).then((res) {
      print('Finsish register');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(child: Text('Register'))),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: _usename,
                  decoration: InputDecoration(hintText: 'username'),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: _firstname,
                  decoration: InputDecoration(hintText: 'first name'),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: _lastname,
                  decoration: InputDecoration(hintText: 'last name'),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: _onRegiste,
                      child: Text('ok'),
                    ))
              ],
            )));
  }
}
