import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'member.dart';
import 'strings.dart';

class FirstAppState extends State<FirstApp> {

  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context){
    return Scaffold (
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _members.length * 2,
        itemBuilder: (BuildContext context, int position){
          if (position.isOdd) return Divider();

          final index = position ~/ 2;
          return _buildRow(index);
        }),
    );
  }

  @override
  void initState(){
    super.initState();

    _loadData();
  }

  Widget _buildRow(int i){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text("${_members[i].login}", style: _biggerFont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatarUrl)
        ),
      )
    );
  }

  //chamada assincrona para serviço http que retorna os dados.
  _loadData() async {
    String dataUrl = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataUrl);
    setState((){
      final membersJson = json.decode(response.body);

      for (var memberJson in membersJson) {
        final member = Member(memberJson["login"], memberJson["avatar_url"]);
        _members.add(member);
      }
    });
  }
}


class FirstApp extends StatefulWidget {
  @override
  createState() => FirstAppState();
}
