import 'package:flutter/material.dart';
import 'package:flutter_auth/auth.dart'; // Assuming you have a file named auth.dart where the Auth class is defined

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User not logged in');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut, 
      child: const Text('Sign Out')
    );
  }

  Widget _title() {
    return const Text('Home Page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ), // AppBar
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
