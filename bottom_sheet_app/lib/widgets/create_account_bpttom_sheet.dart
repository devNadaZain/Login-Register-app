import 'package:flutter/material.dart';

import 'login_bottom_sheet.dart';

class CreateAccountBottomSheet extends StatefulWidget {
  CreateAccountBottomSheet({super.key});

  @override
  State<CreateAccountBottomSheet> createState() =>
      _CreateAccountBottomSheetState();
}

class _CreateAccountBottomSheetState extends State<CreateAccountBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _courseController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Hello...',
                  style: TextStyle(fontSize: 15, color: Color(0xFF050522)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Register',
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
              const SizedBox(height: 15),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person_2_outlined),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'username',
                  labelText: 'Username',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter username.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _courseController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.book_online_outlined),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'Course',
                  labelText: 'Course',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter coursename.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility_outlined),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'password',
                  labelText: 'Password',
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
              const SizedBox(height: 15),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.visibility_outlined),
                  labelStyle: TextStyle(color: Color(0xFF050522)),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF050522)),
                  ),
                  hintText: 'confirmPassword',
                  labelText: 'confirmPassword',
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
                  _CreateAccountBottomSheetState();
                },
                child: const Text(
                  'Register',
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
                  const Text('Already have account? '),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        backgroundColor: Color(0xFFFFECAA),
                        context: context,
                        builder: (context) => LoginBottomSheet(),
                      );
                    },
                    child: const Text('Login',
                        style: TextStyle(color: Color(0xFF050522))),
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
