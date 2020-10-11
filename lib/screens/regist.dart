import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Regist extends StatefulWidget {
  @override
  _Regist createState() => _Regist();
}

class _Regist extends State<Regist> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
          TextField(
            controller: nameController,
            decoration: new InputDecoration.collapsed(hintText: "Name"),
          ),
          FlatButton(
              child: Text("회원가입", style: TextStyle(fontSize: 24)),
              onPressed: () => regist(),
              color: Colors.black,
              textColor: Colors.white),
        ],
      ),
    );
  }

  void regist() async {
    final response = await http.post('http://3.35.124.121/auth/regist',
        body: jsonEncode({
          'us_phone_number': phoneNumberController.text,
          'us_password': passwordController.text,
          'us_name': nameController.text
        }),
        headers: {'Content-Type': "application/json"});
    print(jsonDecode(response.body));
    Navigator.pushNamed(context, '/login');
  }
}
