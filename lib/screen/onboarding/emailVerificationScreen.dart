import 'package:flutter/material.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        screenBackground(context),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Verify Your Email", style: head1Text(colorDarkBlue)),
                    const SizedBox(height: 5),
                    Text("A 6 digit code has been sent to your email",
                        style: head6Text(colorLightGray)),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your email";
                        }
                      },
                      controller: emailController,
                      decoration: appInputDecoration("Enter your email"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: appButtonStyle(),
                      child: successButtonChild('Verify'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/pinVerification');
                        }
                      },
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
            ))
      ]),
    );
    ;
  }
}
