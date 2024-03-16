import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';

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

      // Navigate to HomePage after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomiePage()),
      );
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
                border: Border.all(width: 1),
              ),
              child: SizedBox(
                height: 400,
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
                          style: TextStyle(color: Color.fromARGB(255, 244, 249, 249)),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
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
                          style: TextStyle(color: Color.fromARGB(255, 241, 247, 247)),
                          controller: _passController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            labelText: 'Password',
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()),
                            );
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
