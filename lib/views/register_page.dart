import 'package:flutter/material.dart';
import '../components/custom_text_form_field.dart';
import '../components/primary_button.dart';
import '../components/navigation_text_button.dart';
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final AuthController _authController = AuthController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      User user = User(
        
        id: _idController.text,
        userName: _usernameController.text,
        name: _nameController.text,
        role: _roleController.text,
      );

      bool success = await _authController.register(UserModel(user: user));

      if (success) {
        print('Registration successful');
        // Navigate to login or home
      } else {
        print('Registration failed');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration failed'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
              CustomTextFormField(
                controller: _nameController,
                labelText: 'Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                controller: _roleController,
                labelText: 'Role',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              PrimaryButton(
                onPressed: _register,
                text: 'Register',
              ),
              SizedBox(height: 20),
              NavigationTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                text: 'Already have an account? Login here.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
