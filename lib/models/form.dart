import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/show_info.dart';

enum UserMode {
  signIn,
  signUp,
}

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  UserMode userMode = UserMode.signIn;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var form = GlobalKey<FormState>();

  void toggleUserMode() {
    if (userMode == UserMode.signIn) {
      setState(() {
        userMode = UserMode.signUp;
      });
    } else {
      setState(() {
        userMode = UserMode.signIn;
      });
    }
  }

  Future<void> saveForm() async {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();
    Navigator.pushNamed(
      context,
      ShowInfo.routeName,
      arguments: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please provide a valid email';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide an Password';
                  }
                  if (value.length < 6) {
                    return 'provide a password longer than 6 character';
                  }
                  return null;
                },
                textInputAction: userMode == UserMode.signIn
                    ? TextInputAction.done
                    : TextInputAction.next,
              ),
            ),
            if (userMode == UserMode.signUp)
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirm password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm the Password';
                    }
                    if (value != passwordController.text) {
                      return 'it does not match with the password';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                ),
              ),
            SizedBox(
              height: userMode == UserMode.signIn ? 40 : 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    userMode == UserMode.signIn ? 'Sign in' : 'Sign up',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  onTap: saveForm,
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple,
                    child: Icon(
                      size: 30,
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: userMode == UserMode.signIn ? 35 : 20,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: toggleUserMode,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    userMode == UserMode.signIn ? 'Sign up' : 'Sign in',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
