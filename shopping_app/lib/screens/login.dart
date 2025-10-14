// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import '../colors.dart';

class LoginPage extends StatefulWidget {
const LoginPage({Key? key}) : super(key: key);

@override
_LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: (Colors.white), 
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Image.asset('assets/grafix.png'),
                ),

                // const Text( 
                //   'Welcome to Grafix',
                //   style: TextStyle(
                //     fontSize: 32,
                //     color: Color(0xFF4b5ae4),
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                Text(
                  'GRAFIX',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const Text(
                  'Digital Products Marketplace',
                ),
                
              ],
            ),
            
            const SizedBox(height: 120.0),
            // Remove filled: true values (103)
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                // Removed filled: true
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                // Removed filled: true
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            // TODO: Add TextField widgets (101)
            // [Name]

            // TextField(
            //   controller: _usernameController,
            // ),

            // TextField(
            //   controller: _usernameController,
            //   decoration: const InputDecoration(
            //     filled: true,
            //     fillColor: Color(0xFFe8f0fc), //tambah 0xFF di depan, sdah default
            //     labelText: 'Username',
            //   ),
            // ),

            // spacer
            const SizedBox(height: 12.0),

            // [Password]
            // TextField(
            //   controller: _passwordController,
            // ),
            // TextField(
            //   controller: _passwordController,
            //   decoration: const InputDecoration(
            //     filled: true,
            //     fillColor: Color(0xFFe8f0fc),
            //     labelText: 'Password',
            //   ),
            //   obscureText: true,
            // ),
            
            //spacer
            const SizedBox(height: 12.0),

            // TODO: Add button bar (101)
            OverflowBar(
              alignment: MainAxisAlignment.end,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              
              
              children: <Widget>[
                // TODO: Add buttons (101)

                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: kShrineBlue900,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))
                    ),
                  )
                ),
                
                //spacer between CANCEL and NEXT
                const SizedBox(width: 16.0),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    //Navigasi ke home
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
                  },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kShrineBlue900,
                    foregroundColor: kShrineBlue100,

                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
