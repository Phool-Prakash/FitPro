import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _otpController = TextEditingController();
  bool _isResendActive = false;
  int _resendTime = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_resendTime > 0) {
        setState(() {
          _resendTime--;
        });
        _startTimer();
      } else {
        setState(() {
          _isResendActive = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the 8-digit code sent to your email.',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'balamrawat123@gmail.com',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Add functionality to edit email
                  },
                  child: Text(
                    'Edit',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: '8-digit code',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _isResendActive
                      ? () {
                    setState(() {
                      _resendTime = 30;
                      _isResendActive = false;
                      _startTimer();
                    });
                  }
                      : null,
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                _isResendActive
                    ? 'Resend code'
                    : 'Resend code in $_resendTime s',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to continue
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}