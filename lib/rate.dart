import 'package:flutter/material.dart';

class RatePage extends StatefulWidget {
  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  double _rating = 0.0;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (_rating >= 4) {
      backgroundColor = Colors.green.shade50;
    } else if (_rating >= 2) {
      backgroundColor = Colors.amber.shade50;
    } else {
      backgroundColor = Colors.red.shade50;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Us'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              backgroundColor.withOpacity(0.5),
              backgroundColor.withOpacity(0.8),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'How would you rate your experience?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: _rating == 0
                              ? Text(
                                  'Please rate us!',
                                  key: ValueKey('rate_text'),
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : _rating >= 4
                                  ? Icon(
                                      Icons.sentiment_satisfied_rounded,
                                      size: 64,
                                      color: Colors.green,
                                    )
                                  : _rating >= 2
                                      ? Icon(
                                          Icons.sentiment_neutral_rounded,
                                          size: 64,
                                          color: Colors.amber,
                                        )
                                      : Icon(
                                          Icons.sentiment_dissatisfied_rounded,
                                          size: 64,
                                          color: Colors.red,
                                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Slider(
                      value: _rating,
                      min: 0,
                      max: 5,
                      divisions: 10,
                      label: _rating.toString(),
                      onChanged: (value) {
                        setState(() {
                          _rating = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitRating,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                child: _isSubmitting
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        'Submit Rating',
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitRating() {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate rating submission with a delay
    Future.delayed(Duration(seconds: 2), () {
      print('User rated: $_rating');

      setState(() {
        _isSubmitting = false;
      });

      // Show a confirmation dialog or navigate back
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rating Submitted'),
            content: Text('Thank you for your feedback!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}
