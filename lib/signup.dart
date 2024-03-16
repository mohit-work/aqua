import 'package:flutter/material.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login
      print('Login successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 93, 92, 92),toolbarHeight: 10,),
    backgroundColor: Color.fromARGB(255, 5, 5, 5),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 170.0,
          left: 20,
          right: 20,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            color: Color.fromARGB(255, 73, 206, 232),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 1), // Add border to the container
          ),
          child: SizedBox(
            height: 450, // Set a fixed height for the Container
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 16),
                    Text(
                      "SIGNUP PAGE",
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 6, 6), fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      style: TextStyle(color: Color.fromARGB(255, 11, 11, 11)),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .black, // Set the background color of the button
                      ),
                      onPressed: _login,
                      child: Text('SIGNUP'),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(), 
                    ),
                  ); 
                      },
                      child: Text(
                          'Already have an account? Login'), // Change the text here if needed
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
