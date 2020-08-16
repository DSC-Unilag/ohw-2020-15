import 'package:ExaminationAppOHW20/controllers/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utilities/app_widgets.dart';
import '../../utilities/constants.dart';
import '../../utilities/style.dart' as Style;
import '../dashboard/dashboard.dart';
import 'sign_up.dart';

class LoginScreen extends StatelessWidget {
//Variables
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();

  //Functions
  _loginUser(BuildContext context, String email, String password) async {
    final AuthController _authController =
        Provider.of<AuthController>(context, listen: false);

    OperationStatus status =
        await _authController.loginUser(context, email, password);
    if (status == OperationStatus.success) {
      _gotoDashboard(context);
      _authController.saveUserEmailOnDevice();
    }
  }

  _gotoSignUpScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => SignUpScreen(),
      ),
    );
  }

  _gotoDashboard(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (_) => Dashboard(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.themeWhite,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          constraints: BoxConstraints.tightFor(
            height: (MediaQuery.of(context).size.height - kToolbarHeight - 40)
                .clamp(400.0, 700.0),
            width: MediaQuery.of(context).size.width.clamp(150.00, 400.0),
          ),
          child: SafeArea(
            child: Form(
              key: _loginForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Style.OhwExamAppIcons.ohwExamAppIcon,
                    size: 72,
                    color: Style.themeGreen,
                  ),
                  Spacer(),
                  Text(
                    'Welcome back!',
                    style: Style.body2Bold.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 40),
                  RegularLabelTextField(
                    label: 'Email Address',
                    hint: 'bobby@axelrod.com',
                    controller: _email,
                    validator: (String value) {
                      if (value.isEmpty)
                        return "Field cannot be empty";
                      else if (!value.contains('@') || !value.contains('.'))
                        return "Enter a valid email";
                      else
                        return null;
                    },
                  ),
                  SizedBox(height: 16),
                  PasswordField(
                    label: 'Password',
                    hint: 'Enter the password for your account',
                    controller: _password,
                    validator: (String value) {
                      return value.isEmpty ? "Enter your password" : null;
                    },
                  ),
                  SizedBox(height: 16),
                  BigButton(
                    label: 'Sign In',
                    onTap: () {
                      if (_loginForm.currentState.validate()) {
                        _loginUser(
                            context, _email.text.trim(), _password.text.trim());
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 16),
        height: 32,
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            _gotoSignUpScreen(context);
          },
          child: Text(
            'Don’t have an account? Sign Up',
            style: Style.body2Light,
          ),
        ),
      ),
    );
  }
}
