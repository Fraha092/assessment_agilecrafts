import 'package:assessment/main.data.dart';
import 'package:assessment/model/AuthenticationRequest.dart';
import 'package:assessment/model/AuthenticationResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ProductListScreen.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userNameController=TextEditingController(text: 'asif');
    final passwordController=TextEditingController(text: 'password1');

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await ref.authenticationResponses.authenticationAdapter.LoginAuthentication(
                    10,
                    AuthenticationRequest(userNameOrEmailAddress: userNameController.text,
                        password: passwordController.text)).then((value) =>

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListScreen())));
              },
              child: Text('Login Authentication'),
            ),
          ],
        ),
      ),
    );  }
}
