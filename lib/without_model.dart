import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_model.dart';

class WithoutModel extends StatefulWidget {
  const WithoutModel({super.key});

  @override
  State<WithoutModel> createState() => _WithoutModelState();
}

class _WithoutModelState extends State<WithoutModel> {
  // var users = getUsers();
  // static  getUsers() {
   var data = [
      {
        "username": "Emma Spoon",
        "email": "Emma.Spoon@gmail.com",
        "urlAvatar":
            "https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80"
      },
      {
        "username": "James Winter",
        "email": "James.Winter@gmail.com",
        "urlAvatar":
            "https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80"
      },
    ];
    // return data.map<User>(User.fromJson).toList();
  //   return data.toList();
  // }

  @override
  Widget build(BuildContext context) {
    // print("=====================${users}");
      print("=====================${data.length}");
      print("=====================${data[0]['email'].toString()}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          // getUsers().length.toString()
          data[0]['email'].toString()
          ),
      ),
      body: Center(
        child: buildUsers(),
      ),
    );
  }

  Widget buildUsers() => ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final user = data[index];
        return Card(
          child: ListTile(
            // leading: CircleAvatar(
            //   radius: 28,
            //   backgroundImage: NetworkImage(user['urlAvatar'].toString()),
            // ),
            title: Text(user['username'].toString()),
            subtitle: Text( data[0]['email'].toString()),
          ),
        );      });
}
