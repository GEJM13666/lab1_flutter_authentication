import 'package:flutter/material.dart';
import '../components/custom_text_form_field.dart';
import '../components/primary_button.dart';
import '../components/navigation_text_button.dart';
import '../controllers/auth_controller.dart';
import '../controllers/auth_service.dart';
import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = AuthController();



void _login() async{
  if(_formKey.currentState!.validate()){
    print('Username:${_usernameController.text}');
    print('Password:${_passwordController.text}');
  }
    try{
      final user = AuthService().login(_usernameController.text, _passwordController.text);
    }catch(e){
      print(e);
    }
}


  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     User user = User(
  //       id: _idController.text,
  //       userName: _nameController.text,
  //       name: _nameController.text,
  //       role: _roleController.text,
  //     );

  //     String? token = await _authController.login(UserModel(user: user));

  //     if (token != null) {
  //       print('Login successful: $token');
  //       // Navigate to home or dashboard
  //     } else {
  //       print('Login failed');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Login failed'),
  //       ));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _usernameController,
                labelText: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              PrimaryButton(
                onPressed: _login,
                text: 'Login',
              ),
              SizedBox(height: 20),
              NavigationTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                text: 'Don\'t have an account? Register here.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



