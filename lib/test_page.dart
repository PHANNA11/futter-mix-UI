import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/botton_page.dart';
import 'package:new_app/build_google_map.dart';
import 'package:new_app/home_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            leading: const CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'Mobile App ',
              style: TextStyle(fontFamily: 'AmaticSC-Bold'),
            ),
            subtitle: Text('Flutter '),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlutterBottonPage(),
                  ));
            },
            leading: const CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'Mobile Botton ',
              style: TextStyle(fontFamily: 'AmaticSC-Bold'),
            ),
            subtitle: Text('Flutter '),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuildGoogleMap(),
                  ));
            },
            leading: const CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'Google Map ',
              style: TextStyle(fontFamily: 'AmaticSC-Bold'),
            ),
            subtitle: Text('Flutter '),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
