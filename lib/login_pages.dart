import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          // Centering the content horizontally and vertically
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'icons.png', // Change to your logo file path
                  width: 100, // Set width as needed
                  height: 100, // Set height as needed
                ), // Logo at the top
                const SizedBox(height: 20),
                _usernameField(), // Username input field
                const SizedBox(height: 20),
                _passwordField(), // Password input field
                const SizedBox(height: 20),
                _loginButton(context), // Login button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      onChanged: (value) {
        username = value;
      },
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Username',
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isLoginSuccess
                ? const Color.fromARGB(255, 92, 190, 95)
                : Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      onChanged: (value) {
        password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isLoginSuccess
                ? const Color.fromARGB(255, 92, 190, 95)
                : Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isLoginSuccess
              ? const Color.fromARGB(255, 92, 190, 95)
              : Colors.red,
        ),
        onPressed: () {
          String text = "";
          if (password == "flutter123") {
            setState(() {
              text = "Login successful";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage(username: username);
            }));
          } else {
            setState(() {
              text = "Login failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Log In'),
      ),
    );
  }
}
