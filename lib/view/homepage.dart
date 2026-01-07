import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_queue_app/service/auth_service.dart';
import 'package:smart_queue_app/view/homepage_customer.dart';
import 'package:smart_queue_app/viewmodel/auth_viewmodel.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void logout(AuthViewModel vm){
    //get auth service
    vm.logout();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: ()=> logout(authVM), icon: Icon(Icons.logout))
        ],
      ),
      body: HomepageCustomer()
    );
  }
}