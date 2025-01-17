import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/screens/auth/login.dart';
import 'package:coindock_app/service/_authService.dart';
import 'package:coindock_app/widgets/input/auth_input.dart';
import 'package:coindock_app/widgets/input/auth_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text('Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              // AuthInput(controller: _usernameController, hintText: 'Username'),
              // SizedBox(height: 16),
              AuthInput(controller: _emailController, hintText: 'Email'),
              SizedBox(height: 16),
              PasswordInput(controller: _passwordController),
              SizedBox(height: 36),
              _createAccountButton(context),
              SizedBox(height: 16),
              _loginButton(context),
              _divider(),
              _googleAccountButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _divider() {
    return Container(
              margin: EdgeInsets.symmetric( vertical: 16),
              child: Row(
                children: [
                  Expanded(child: Divider(color: AppColors.text100, height: 1)),
                  SizedBox(width: 11),
                  Text('Or', style: TextStyle(color: AppColors.dark, fontWeight: FontWeight.w600)),
                  SizedBox(width: 12),
                  Expanded(child: Divider(color: AppColors.text100, height: 1)),
              ]),
            );
  }

  SizedBox _googleAccountButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: (){
            final response = AuthService().googleSignIn;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.toString())));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.grey,
            side: BorderSide(color: AppColors.text100, width: 1),
            padding: const EdgeInsets.symmetric(vertical: 16),                      
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/google.svg', width: 16, height: 16),
              SizedBox(width: 8
              ),
              Text('Google Account', style: TextStyle(fontSize: 14, color: AppColors.dark)),
            ],
          ),
      ),
    );
  }

  SizedBox _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.grey,
            side: BorderSide(color: AppColors.text100, width: 1),
            padding: const EdgeInsets.symmetric(vertical: 16),                      
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          child: Text('Log In', style: TextStyle(fontSize: 14, color: AppColors.dark)),
      ),
    );
  }

  SizedBox _createAccountButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          String? validationMessage = _validateInput();

          if (validationMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(validationMessage)),
            );
            return;
          }

          final response = await AuthService().register(_emailController.text, _passwordController.text);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.toString())),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.primary,
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text('Create Account',
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }

  String? _validateInput() {
    if (_emailController.text.isEmpty) {
      return 'Email is required';
    }
    if (!_isValidEmail(_emailController.text)) {
      return 'Invalid email format';
    }
    if (_passwordController.text.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }
}
