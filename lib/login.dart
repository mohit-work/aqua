import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login
      print('Login successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 93, 92, 92),
        toolbarHeight: 10,
      ),
      backgroundColor: Color.fromARGB(255, 5, 5, 5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 110.0,
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
                color: Color.fromARGB(255, 38, 37, 37),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1), // Add border to the container
              ),
              child: SizedBox(
                height: 400, // Set a fixed height for the Container
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 16),
                        Text(
                          "LOGIN PAGE",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 244, 249, 249)),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: ' Email Address',
                            hintText: 'e.g., example@domain.com',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 241, 247, 247)),
                          controller: _passController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            labelText: ' Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _login,
                          child: Text('Login'),
                        ),
                        SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () async {
                            try {
                              final userCredential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passController.text.trim(),
                              );
                              print(userCredential);
                            } on FirebaseAuthException catch (e) {
                              String message =
                                  'An error occurred during login.';
                              switch (e.code) {
                                case 'invalid-credential':
                                  message = 'Invalid email or password.';
                                  break;
                                default:
                                  message = 'An unexpected error occurred.';
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Text('Don\'t have an account? Sign up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'from the genius minds of Scrappy Kats',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey<FormState>>('_formKey', _formKey));
    properties.add(DiagnosticsProperty<GlobalKey<FormState>>('_formKey', _formKey));
    properties.add(DiagnosticsProperty<GlobalKey<FormState>>('_formKey', _formKey));
    properties.add(DiagnosticsProperty<GlobalKey<FormState>>('_formKey', _formKey));
  }
}
