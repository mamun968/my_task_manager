import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> formValue = {
    "email": "emailController.text.trim()",
    "password": "passwordController.text",
  };
  
  bool isLoading = false;

  formOnSubmit() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      bool res = await loginRequest(formValue);
      if (res == true) {
        // Navigator.pushNamed(context, '/pinVerification');
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

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
              child: Visibility(
                visible: isLoading == false,
                replacement: const Center(
                  child: LinearProgressIndicator(
                    color: Colors.green,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Get Started With Us",
                          style: head1Text(colorDarkBlue)),
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
                        validator: (value) => value!.isEmpty || value.length < 6
                            ? "Enter your 6 digit password"
                            : null,
                        controller: passwordController,
                        decoration: appInputDecoration("Enter your password"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: appButtonStyle(),
                        child: successButtonChild('Login'),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            formOnSubmit();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/emailVerification');
                            },
                            child: const Text(
                              "Forgot Password?",
                            )),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registration');
                              },
                              child: const Text("Register"))
                        ],
                      )
                    ]),
              ),
            ))
      ]),
    );
  }
}
