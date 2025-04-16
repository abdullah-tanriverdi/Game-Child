import 'package:flutter/material.dart';
import 'package:hicodechildrights/button.dart';
import 'package:hicodechildrights/color.dart';
import 'package:hicodechildrights/forgot_password.dart';
import 'package:hicodechildrights/home_page.dart';
import 'package:hicodechildrights/otp_verification.dart';
import 'package:hicodechildrights/services/auth_service.dart';
import 'package:hicodechildrights/sign_up.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        foregroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Logo and Title
              Column(
                children: [
                  Image.asset(
                    'lib/images/logo.png', // Replace with your logo path
                    height: 200,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email adresinizi yazın',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  hintText: 'Şifrenizi yazın',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Limit button size to text
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Şifremi Unuttum',
                    style: TextStyle(
                      color: Color.fromARGB(255, 86, 91, 95),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Gradient Button
              GradientButton(
                text: 'Giriş Yap',
                onPressed: () async {
                  final authService = AuthService();
                  final userCredential = await authService.signin(
                    'email@example.com',
                    'password',
                    context,
                  );
                  if (userCredential != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              // Or Divider
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Veya'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Image.asset(
                        'lib/images/google.png',
                        width: 30, // Width
                        height: 30, // Height
                        fit: BoxFit.contain, // Prevent image overflow
                      ),
                      iconSize: 40,
                      onPressed: () async {
                        final authService = AuthService();
                        final userCredential = await authService.signInWithGoogle(context);
                        if (userCredential != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }

                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: IconButton(
                      icon: Image.asset(
                        'lib/images/apple.png',
                        width: 60, // Width
                        height: 60, // Height
                        fit: BoxFit.contain, // Prevent image overflow
                      ),
                      iconSize: 40,
                      onPressed: () async {
                        final authService = AuthService();
                        final userCredential = await authService.signInWithApple(context);
                        if (userCredential != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Log In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hesabın yok mu? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Limit button size to text
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
