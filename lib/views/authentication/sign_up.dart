import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../authentication/succesful_sign_up.dart';
import '../../utilities/style.dart' as Style;
import '../../utilities/app_widgets.dart';
import '../../controllers/authentication_controller.dart';

class SignUpScreen extends StatelessWidget {
  //Variables
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _signUpForm = GlobalKey<FormState>();

  //Functions
  _gotoLoginScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );
  }

  _gotoSuccesfulSignUpScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => SuccesfulSignUpScreen(),
      ),
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
                .clamp(600.00, 900.00),
            width: MediaQuery.of(context).size.width.clamp(150.00, 400.00),
          ),
          child: SafeArea(
            child: Form(
              key: _signUpForm,
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
                    'Create your account!',
                    style: Style.body2Bold.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 40),
                  RegularLabelTextField(
                    label: 'First Name',
                    hint: 'Isaac',
                    controller: _firstName,
                  ),
                  SizedBox(height: 8),
                  RegularLabelTextField(
                    label: 'Last Name',
                    hint: 'Newton',
                    controller: _lastName,
                  ),
                  SizedBox(height: 8),
                  RegularLabelTextField(
                    label: 'Email Address',
                    hint: 'isaacwonder@gmail.com',
                    controller: _email,
                  ),
                  SizedBox(height: 8),
                  PasswordField(
                    label: 'Password',
                    hint: 'Enter the password for your account',
                    controller: _password,
                  ),
                  SizedBox(height: 8),
                  PasswordField(
                    label: 'Confirm Password',
                    hint: 'Confirm your password',
                    controller: _confirmPassword,
                  ),
                  SizedBox(height: 16),
                  BigButton(
                    label: 'Sign Up',
                    onTap: () async {
                      if (_signUpForm.currentState.validate()) {
                        //TODO: create with input data
                        User newAccount = User();
                        AuthController _authController = AuthController();
                        OperationStatus status =
                            await _authController.createNewAccount(newAccount);

                        if (status == OperationStatus.success)
                          _gotoSuccesfulSignUpScreen(context);
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
            _gotoLoginScreen(context);
          },
          child: Text(
            'Already have an account? Sign In',
            style: Style.body2Light,
          ),
        ),
      ),
    );
  }
}
