import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_model.dart';

class AssetjsonOrApijson extends StatefulWidget {
  const AssetjsonOrApijson({super.key});

  @override
  State<AssetjsonOrApijson> createState() => _HomePageState();
}

class _HomePageState extends State<AssetjsonOrApijson> {
  // late Future<List<User>> userFuture;                 this is json asset data]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] 

  // @override
  // void initState() {
  //   super.initState();
  //   userFuture = getUsers(context);
  // }

  // static Future<List<User>> getUsers(BuildContext context) async {
  //   final assetBundle = DefaultAssetBundle.of(context);
  //   final data = await assetBundle.loadString('assets/users.json');
  //   final body = json.decode(data);
  //   return body.map<User>(User.fromJson).toList();
  // }

  // ===============================================this is api json data]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]

  Future<List<User>> userFuture = getUsers();

  static Future<List<User>> getUsers() async {
    const url =
        "https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/other%2Fvideo126%2Fusers.json?alt=media";
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);

    return body.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('ho'),
        ),
        body: Center(
          child: FutureBuilder(
              future: userFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return buildUsers(users);
                } else {
                  return Text("No user data");
                }
              }),
        ));
  }

  Widget buildUsers(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(user.urlAvatar),
            ),
            title: Text(user.username),
            subtitle: Text(user.email),
          ),
        );
      });
}
