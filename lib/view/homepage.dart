import 'package:flutter/material.dart';
import 'package:smart_queue_app/service/auth_service.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void logout(){
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("ASDASSD"),
      ),
    );
  }
}