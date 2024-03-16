import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                      textInputAction: TextInputAction.next,
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : 'Please enter a valid email address.',
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'e.g., example@domain.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                    ),
                   SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .black, // Set the background color of the button
                      ),
                       onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        print(userCredential);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration successful!'),
                          ),
                          
                        );
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HomiePage(), // Navigate to the RatePage
                    ),
                  );
                        
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message!),
                          ),
                        );
                      }
                    }
                  },
                      child: Text('SIGNUP'),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
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
