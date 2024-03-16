import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:110.0,left:20,right:20,),
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
                        style:TextStyle(color: Color.fromARGB(255, 244, 249, 249)),
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
                        style:TextStyle(color: Color.fromARGB(255, 241, 247, 247)),
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
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
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
        Text('from the genius minds of Scrappy Kats',style: TextStyle(color: Colors.white),),
      ],
    ),
  );
}
}
