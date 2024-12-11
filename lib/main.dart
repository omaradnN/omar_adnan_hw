import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تسجيل الدخول',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void validateInputs(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;
    String email = emailController.text;

    if (username.isEmpty) {
      _showDialog(context, 'يرجى إدخال اسم المستخدم');
    } else if (password.isEmpty) {
      _showDialog(context, 'يرجى إدخال كلمة المرور');
    } else if (email.isEmpty) {
      _showDialog(context, 'يرجى إدخال البريد الإلكتروني');
    } else if (!EmailValidator.validate(email)) {
      _showDialog(context, 'البريد الإلكتروني غير صالح');
    } else {
      _showDialog(context, 'تم تسجيل الدخول بنجاح');
    }
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('التحقق'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('حسناً'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              width: 300, // تحديد عرض البطاقة
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue[50], // تغيير لون خلفية البطاقة
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('تسجيل الدخول'),
                    onPressed: () {
                      validateInputs(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
