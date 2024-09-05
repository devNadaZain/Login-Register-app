import 'package:bottom_sheet_app/controllers/user_controller.dart';
import 'package:bottom_sheet_app/widgets/create_account_bpttom_sheet.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class LoginBottomSheet extends StatefulWidget {
  LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final userController = UserController();
  bool? _rememberMe = false;

  void _Login() {
    if (_formKey.currentState!.validate()) {
      final user = User(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      userController.createUser(user.username, user.password);
      print('Login Successful');
      Navigator.pop(context);
    } else {
      print('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Welcome Back!!!',
                style: TextStyle(fontSize: 15, color: Color(0xFF050522)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                suffixIcon: Icon(Icons.lock_outline_rounded),
                labelStyle: TextStyle(color: Color(0xFF050522)),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF050522)),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_outlined),
                labelStyle: TextStyle(color: Color(0xFF050522)),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF050522)),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password.';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: CheckboxListTile(
                    title: const Text('Remember Me'),
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true, //1
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //2
                    visualDensity: VisualDensity.compact, //3
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(
                        () {
                          _rememberMe = value;
                        },
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?',
                      style: TextStyle(color: Color(0xFF050522))),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(281, 60),
                backgroundColor: Color(0xFF050522),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                _Login();
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFFFDE69),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      backgroundColor: Color(0xFFFFECAA),
                      context: context,
                      builder: (context) => CreateAccountBottomSheet(),
                    );
                  },
                  child: const Text('Create Account',
                      style: TextStyle(color: Color(0xFF050522))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
