import 'package:eca_packages/buttons/default_rounded_border_button.dart';
import 'package:flutter/material.dart';

class WelcomePageAccessButtons extends StatelessWidget {
  final Color registerButtonTextColor;
  final MaterialColor registerButtonBorderColor;
  final MaterialColor registerButtonBackgroundColor;
  final Color loginButtonTextColor;
  final Color loginButtonBorderColor;
  final Color loginButtonBackgroundColor;
  final VoidCallback onRegisterButtonPressed;
  final VoidCallback onLoginButtonPressed;

  const WelcomePageAccessButtons({
    Key? key,
    required this.registerButtonTextColor,
    required this.registerButtonBorderColor,
    required this.registerButtonBackgroundColor,
    required this.onRegisterButtonPressed,
    required this.loginButtonTextColor,
    required this.loginButtonBorderColor,
    required this.loginButtonBackgroundColor,
    required this.onLoginButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultRoundedBorderButton(
            backgroundColor: registerButtonBackgroundColor.shade400,
            fontColor: registerButtonTextColor,
            fontSize: 20,
            text: 'Cadastrar',
            checked: true,
            width: MediaQuery.of(context).size.width * 0.8,
            borderColor: registerButtonBorderColor,
            height: 60,
            onPressed: onRegisterButtonPressed,
          ),
          const SizedBox(height: 20),
          DefaultRoundedBorderButton(
            backgroundColor: loginButtonBackgroundColor,
            fontColor: loginButtonTextColor,
            borderColor: loginButtonBorderColor,
            checked: true,
            text: 'Login',
            fontSize: 20,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60,
            onPressed: onLoginButtonPressed,
          )
        ],
      ),
    );
  }
}
