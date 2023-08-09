import 'package:flutter/material.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          screenBackground(context),
          SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Join With Us", style: head1Text(colorDarkBlue)),
                        const SizedBox(height: 5),
                        Text("Learn with me", style: head6Text(colorLightGray)),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "Enter your email" : null,
                          controller: emailController,
                          decoration: appInputDecoration("Enter your email"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: firstNameController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter your First name" : null,
                          decoration:
                              appInputDecoration("Enter your First name"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: lastNameController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter your Last name" : null,
                          decoration:
                              appInputDecoration("Enter your Last name"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) =>
                              value!.isEmpty || value.length < 11
                                  ? "Enter your valid  phone number"
                                  : null,
                          decoration:
                              appInputDecoration("Enter your phone number"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) =>
                              value!.isEmpty || value.length < 6
                                  ? "Enter your 6 digit password"
                                  : null,
                          decoration: appInputDecoration("Enter your password"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) => passwordController.text != value
                              ? "Password does not match"
                              : null,
                          decoration:
                              appInputDecoration("Confirm your password"),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: appButtonStyle(),
                          child: successButtonChild('Login'),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/setPassword');
                              },
                              child: const Text(
                                "Forgot Password?",
                              )),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Have an account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text("Sign In"))
                          ],
                        )
                      ]),
                )),
          )
        ]),
      ),
    );
  }
}
