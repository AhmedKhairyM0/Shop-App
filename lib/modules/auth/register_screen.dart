import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/core/routes.dart';
import 'package:shop_app/core/space_config.dart';
import 'package:shop_app/core/utils.dart';
import 'package:shop_app/core/validation.dart';
import 'package:shop_app/modules/auth/widgets/custom_text_form.dart';
import 'package:shop_app/shared/widgets/custom_buttons.dart';
import 'package:shop_app/shared/widgets/loading_indicator.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/auth_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _phone = "";
  String _password = "";
  String _confirmPassword = "";

  late Widget _widget = GeneralButton(
    label: "Sign up",
    onPressed: () {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        AuthCubit.get(context).signup(
          name: _name,
          email: _email,
          password: _password,
          phone: _phone,
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            _widget = const LoadingIndicator();
          }
          if (state is AuthSuccessState) {
            Utils.toOffAll(context, RouteGenerator.homeScreen);
          }
          if (state is AuthErrorState) {
            Utils.showToast(
              message: state.message,
              type: ToastType.error,
            );
            _widget = GeneralButton(
              label: "Sign up",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  AuthCubit.get(context).signup(
                    name: _name,
                    email: _email,
                    password: _password,
                    phone: _phone,
                  );
                }
              },
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Sign up',
                        style: Theme.of(context).textTheme.headline5),
                    Text('Welcome sign up to continue,',
                        style: Theme.of(context).textTheme.bodyText2),
                    const VerticalSpace(value: 30),
                    CustomTextForm(
                      hint: 'Name',
                      validator: Validation.validateName,
                      onChanged: (name) {
                        if (name != null) _name = name;
                      },
                    ),
                    const VerticalSpace(value: 15),
                    CustomTextForm(
                      hint: 'Email',
                      validator: Validation.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (email) {
                        if (email != null) _email = email;
                      },
                    ),
                    const VerticalSpace(value: 15),
                    CustomTextForm(
                      hint: 'Phone',
                      validator: Validation.validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (phone) {
                        if (phone != null) _phone = phone;
                      },
                    ),
                    const VerticalSpace(value: 15),
                    CustomTextForm(
                      hint: 'Password',
                      validator: Validation.validatePassword,
                      isNotVisable: true,
                      onChanged: (password) {
                        if (password != null) _password = password;
                      },
                    ),
                    const VerticalSpace(value: 15),
                    CustomTextForm(
                      hint: 'Confirm Password',
                      validator: (password) {
                        if (_confirmPassword != _password) {
                          return "Not Match";
                        }
                      },
                      isNotVisable: true,
                      onChanged: (confirmPassword) {
                        if (confirmPassword != null) {
                          _confirmPassword = confirmPassword;
                        }
                      },
                    ),
                    const VerticalSpace(value: 40),
                    _widget,
                    const VerticalSpace(value: 30),
                    Text(
                      'or sign up with',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const VerticalSpace(value: 15),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.google,
                              color: Color(0xFFEF5350)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.facebook,
                              color: Color(0xFF1565C0)),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.twitter,
                              color: Colors.blueAccent),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const VerticalSpace(value: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("I have already an account"),
                        CustomTextButton(
                          label: "Login",
                          onPressed: () {
                            Utils.toOffPrevious(
                                context, RouteGenerator.loginScreen);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
