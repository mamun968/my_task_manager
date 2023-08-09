import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formValue = {
    'pin': 'pinController.text.trim()',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PIN Varification", style: head1Text(colorDarkBlue)),
                    const SizedBox(height: 10),
                    Text("A 6 digit pin has been send to your mobile number",
                        style: head6Text(colorLightGray)),
                    const SizedBox(height: 20),
                    PinCodeTextField(
                      controller: pinController,
                      validator: (value) =>
                          value!.length < 6 ? "Enter 6 digit pin" : null,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      pinTheme: appOTPStyle(),
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: appButtonStyle(),
                      child: successButtonChild('Verify'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/setPassword');
                        }
                      },
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
