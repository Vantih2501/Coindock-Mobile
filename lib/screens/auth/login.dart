import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/screens/auth/register.dart';
import 'package:coindock_app/service/_authService.dart';
import 'package:coindock_app/widgets/input/auth_input.dart';
import 'package:coindock_app/widgets/input/auth_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Text('Log In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                )),
              SizedBox(height: 20),
              AuthInput(controller: _emailController, hintText: 'Email'),
              SizedBox(height: 16),
              PasswordInput(controller: _passwordController),
              SizedBox(height: 36),
              _loginButton(context),
              SizedBox(height: 16),
              _createAccountButton(context),
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
                  onPressed: () {
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

  SizedBox _createAccountButton(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
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
                  child: Text('Create Account', style: TextStyle(fontSize: 14, color: AppColors.dark)),
              ),
            );
  }

  SizedBox _loginButton(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: 
            _emailController.text.isEmpty || _passwordController.text.isEmpty 
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_emailController.text.isEmpty ? 'Email is required' : 'Password is required'))
                );
              } 
            : () async {
              final response = await AuthService().login(_emailController.text, _passwordController.text, context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(response.toString()))
              );
              
            },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: AppColors.primary,
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 16),                      
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          child: Text('Log In', style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }
}
