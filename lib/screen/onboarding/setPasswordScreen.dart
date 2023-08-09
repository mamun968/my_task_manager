import 'package:flutter/material.dart';

import '../../style/style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        screenBackground(context),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Password", style: head1Text(colorDarkBlue)),
                    const SizedBox(height: 5),
                    Text(
                        "Choose a strong password combination with at least 6 characters",
                        style: head6Text(colorLightGray)),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter at least 6 characters" : null,
                      controller: passwordController,
                      decoration: appInputDecoration(" New password"),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => passwordController.text != value
                          ? "Enter your 6 digit password"
                          : null,
                      controller: confirmPasswordController,
                      decoration: appInputDecoration("Confirm password"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: appButtonStyle(),
                      child: successButtonChild('Change Password'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                    ),
                  ]),
            ))
      ]),
    );
  }
}
