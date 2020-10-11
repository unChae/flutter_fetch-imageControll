import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: Text("SMOL")),
      body: Column(
        children: <Widget>[
          TextField(
              style: TextStyle(color: Colors.red),
              controller: phoneNumberController,
              decoration:
                  new InputDecoration.collapsed(hintText: "Phone number")),
          TextField(
            controller: passwordController,
            decoration: new InputDecoration.collapsed(hintText: "Password"),
          ),
          FlatButton(
              child: Text("로그인", style: TextStyle(fontSize: 24)),
              onPressed: () => login(),
              color: Colors.black,
              textColor: Colors.white),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/regist');
              },
              child: Text("회원가입"))
        ],
      ),
    );
  }

  void login() async {
    final response = await http.post('http://3.35.124.121/auth/login',
        body: jsonEncode({
          'us_phone_number': phoneNumberController.text,
          'us_password': passwordController.text
        }),
        headers: {'Content-Type': "application/json"});
    var res = jsonDecode(response.body);
    if (res['status'] == 200) {
      Navigator.pushNamed(context, '/');
    }
  }
}
